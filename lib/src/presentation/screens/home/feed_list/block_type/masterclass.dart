
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/asset_constants.dart';
import 'package:miles_education/src/config/constants/size_constants.dart';
import 'package:miles_education/src/config/constants/strings_constants.dart';
import 'package:miles_education/src/presentation/theme/theme_color.dart';
import 'package:miles_education/src/utilities/ui_helper.dart';

import '../../../../../domain/entities/feed/feed_entity.dart';
import '../../../../widget/item_divider.dart';

class Masterclass extends StatefulWidget {
  final String? heading;
  final List<PostData>? posts;
  const Masterclass({super.key, required this.posts, required this.heading});

  @override
  State<Masterclass> createState() => _MasterclassState();
}

class _MasterclassState extends State<Masterclass> {
  String? backdropImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0B1D2F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemDivider(title: widget.heading),
          SizedBox(
            height: ScreenUtil().screenHeight * 0.40,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w, vertical: Sizes.dimen_12.h),
                  child: Opacity(
                    opacity: 0.1,
                    child: CachedNetworkImage(
                      imageUrl: backdropImage ?? "${widget.posts?.first.files?.first.imagePath?.split('?').first}",
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      placeholder: (context, url) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                      errorWidget: (context, url, error) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                    ),
                  ),
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: ScreenUtil().screenHeight * 0.40,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      final item = widget.posts?[index];
                      setState(() {
                        backdropImage = item?.files?.first.imagePath?.split('?').first;
                      });
                    }
                  ),
                  itemCount: widget.posts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    final item = widget.posts?[index];
                    return CachedNetworkImage(
                      imageUrl: item?.files?.first.imagePath?.split('?').first ?? '',
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                      errorWidget: (context, url, error) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                    );
                  },
                )
              ],
            ),
          ),
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_42.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstants.flagbearers,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(StringConstants.accountants,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)
                ),
                UIHelper.verticalSpace(Sizes.dimen_2.h),
                Text(StringConstants.createdWithAtMilesEducation,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColor.white.withOpacity(0.7))
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(Sizes.dimen_42.h),
        ],
      ),
    );
  }
}
