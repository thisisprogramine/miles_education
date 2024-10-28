
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/presentation/widget/background_grid.dart';

import '../../../../../config/constants/asset_constants.dart';
import '../../../../../config/constants/size_constants.dart';
import '../../../../../domain/entities/feed/feed_entity.dart';
import '../../../../theme/theme_color.dart';

class Banners extends StatefulWidget {
  final List<PostData>? posts;
  const Banners({super.key, required this.posts});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  final _pageController = PageController(
    initialPage: 2,
    viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.40,
      child: BackgroundGrid(
        child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.posts?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: Sizes.dimen_12.h, left: Sizes.dimen_8.w, right: Sizes.dimen_8.w),
                child: CachedNetworkImage(
                  imageUrl: widget.posts?.first.files?.first.imagePath?.split('?').first ?? '',
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                  errorWidget: (context, url, error) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                ),
              );
          }
        ),
      )
    );
  }
}
