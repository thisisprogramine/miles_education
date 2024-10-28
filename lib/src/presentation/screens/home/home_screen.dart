
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miles_education/src/config/constants/asset_constants.dart';
import 'package:miles_education/src/config/constants/size_constants.dart';
import 'package:miles_education/src/config/extensions/size_extensions.dart';
import 'package:miles_education/src/injector.dart';
import 'package:miles_education/src/presentation/bloc/feed/feed_cubit.dart';
import 'package:miles_education/src/presentation/bloc/testimonials/testimonials_cubit.dart';
import 'package:miles_education/src/presentation/theme/theme_color.dart';
import 'package:miles_education/src/presentation/widget/background_grid.dart';
import 'package:miles_education/src/presentation/widget/button.dart';
import 'package:miles_education/src/utilities/ui_helper.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/constants/strings_constants.dart';
import '../../bloc/loading/loading_cubit.dart';
import '../../widget/bottom_navigation_clipper.dart';
import '../../widget/button_talk_to_us.dart';
import '../../widget/circular_progress.dart';
import '../../widget/miles_app_bar.dart';
import 'feed_list/feed_listview.dart';
import 'testimonials/testimonials_list.dart';
import 'user_header/user_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FeedCubit _feedCubit;
  late TestimonialsCubit _testimonialsCubit;
  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _feedCubit = getItInstance<FeedCubit>();
    _testimonialsCubit = getItInstance<TestimonialsCubit>();
    _feedCubit.loadFeed();
    _testimonialsCubit.loadTestimonials();
  }

  @override
  void dispose() {
    _feedCubit.close();
    _testimonialsCubit.close();
    super.dispose();
  }

  void _onLoading() async{
    await _feedCubit.loadFeed();
    await _testimonialsCubit.loadTestimonials();
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeedCubit>.value(value: _feedCubit),
        BlocProvider<TestimonialsCubit>.value(value: _testimonialsCubit),
      ],
      child: Scaffold(
        appBar: const MilesAppBar(),
        bottomNavigationBar: ClipPath(
          clipper: BottomNavigationClipper(),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_0.w),
              child: BlocBuilder<FeedCubit, FeedState>(
                  builder: (context, feedState) {
                    return BlocBuilder<TestimonialsCubit, TestimonialsState>(
                        builder: (context, testimonialsState) {
                          if(feedState is FeedLoaded && testimonialsState is TestimonialsLoaded) {
                            return NestedScrollView(
                                physics: const BouncingScrollPhysics(),
                                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                                  return [
                                    const SliverToBoxAdapter(
                                        child: UserHeader()
                                    ),
                                    SliverToBoxAdapter(
                                        child: TestimonialsList(testimonials: testimonialsState.testimonials)
                                    ),
                                    SliverToBoxAdapter(
                                        child: UIHelper.verticalSpaceSmall
                                    ),
                                  ];
                                },
                                body: SmartRefresher(
                                    onRefresh: _onLoading,
                                    controller: refreshController,
                                    child: FeedListView(feedData: feedState.feedData))
                            );
                          }else if(feedState is FeedLoading || testimonialsState is TestimonialsLoading) {
                            return const BackgroundGrid(
                              child: Center(
                                child: CircularProgressWidget()
                              ),
                            );
                          }else if(feedState is FeedError || testimonialsState is TestimonialsError) {
                            return Center(
                              child: Text(StringConstants.errorMessage, style: Theme.of(context).textTheme.titleMedium,),
                            );
                          }
                          return const SizedBox.shrink();
                        }
                    );
                  }
              ),
            ),

            /*
             * I used a bottom navigation bar image here because I cannot accommodate the given
             * bottom navigation bar within the specified timeline. Creating the same
             * bottom navigation bar as shown in the provided Figma will require more effort,
             *  including the use of ClipPath, CustomPainter, and custom animations.
             */

            Positioned(
              bottom: 0,
                child: Image.asset(AssetConstants.bottomNavigationBar, width: ScreenUtil().screenWidth, fit: BoxFit.cover,)
            )
          ],
        ),
      ),
    );
  }
}
