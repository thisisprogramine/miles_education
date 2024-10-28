
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/asset_constants.dart';
import '../../../../../config/constants/size_constants.dart';
import '../../../../../domain/entities/feed/feed_entity.dart';

class Cta extends StatefulWidget {
  final List<PostData>? posts;
  const Cta({super.key, required this.posts});

  @override
  State<Cta> createState() => _CtaState();
}

class _CtaState extends State<Cta> {
  final _pageController = PageController(
    initialPage: 2,
    viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h, horizontal: Sizes.dimen_12.w),
      child: SizedBox(
        height: ScreenUtil().screenHeight * 0.20,
        child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.posts?.length ?? 0,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.posts?.first.files?.first.imagePath?.split('?').first ?? '',
                fit: BoxFit.contain,
                placeholder: (context, url) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                errorWidget: (context, url, error) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
              );
            }
        ),
      ),
    );
  }
}
