
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/presentation/theme/theme_color.dart';

import '../../../../../config/constants/asset_constants.dart';
import '../../../../../config/constants/size_constants.dart';
import '../../../../../domain/entities/feed/feed_entity.dart';
import '../../../../widget/item_divider.dart';

class Reels extends StatefulWidget {
  final String? heading;
  final List<PostData>? posts;
  const Reels({super.key, required this.posts, required this.heading});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemDivider(title: widget.heading),
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Sizes.dimen_12,
            mainAxisSpacing: Sizes.dimen_12,
            childAspectRatio: 0.65,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final item = widget.posts?[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_2.w, vertical: Sizes.dimen_2.w,),
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Sizes.dimen_5),
                  topRight: Radius.circular(Sizes.dimen_22),
                  bottomLeft: Radius.circular(Sizes.dimen_0),
                  bottomRight: Radius.circular(Sizes.dimen_22),
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
              child: CachedNetworkImage(
                imageUrl: item?.files?.first.thumbnail?.split('?').first ?? '',
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
                errorWidget: (context, url, error) => Image.asset(AssetConstants.placeholder, fit: BoxFit.fill,),
              ),
            );
          },
        )
      ],
    );
  }
}
