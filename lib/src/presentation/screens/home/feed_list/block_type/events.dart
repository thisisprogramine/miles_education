
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/asset_constants.dart';
import '../../../../../config/constants/size_constants.dart';
import '../../../../../domain/entities/feed/feed_entity.dart';
import '../../../../theme/theme_color.dart';
import '../../../../widget/item_divider.dart';

class Events extends StatefulWidget {
  final String? heading;
  final List<PostData?>? posts;
  const Events({super.key, required this.posts, required this.heading});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 0,
      viewportFraction: (widget.posts?.length ?? 0) == 1 ? 1.0 : 0.9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ScreenUtil().screenHeight * 0.30,
        child: Column(
          children: [
            ItemDivider(title: widget.heading),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.posts?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = widget.posts?[index];
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_2.w, vertical: Sizes.dimen_2.w,),
                      margin: EdgeInsets.symmetric(horizontal: (widget.posts?.length ?? 0) == 1 ? Sizes.dimen_12.w : Sizes.dimen_6.w, vertical: Sizes.dimen_0.w,),
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Sizes.dimen_10),
                            topRight: Radius.circular(Sizes.dimen_10),
                            bottomLeft: Radius.circular(Sizes.dimen_10),
                            bottomRight: Radius.circular(Sizes.dimen_10),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF73FAD5),
                              Color(0xFFFDAC1B),
                              Color(0xFFB839FA),
                              Color(0xFFF752AC),
                              Color(0xFF3921FC),
                            ], // Colors in the gradient
                            begin: Alignment.topLeft, // Gradient start point
                            end: Alignment.bottomRight, // Gradient end point
                          )
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.dimen_8),
                        child: CachedNetworkImage(
                          imageUrl: item?.files?.first.imagePath?.split('?').first ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                          errorWidget: (context, url, error) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        )
    );
  }
}
