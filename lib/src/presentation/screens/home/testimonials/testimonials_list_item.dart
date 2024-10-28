
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/asset_constants.dart';

import '../../../../config/constants/size_constants.dart';
import '../../../../domain/entities/testimonials/testimonials_entity.dart';
import '../../../../utilities/ui_helper.dart';
import '../../../theme/theme_color.dart';

class TestimonialsListItem extends StatelessWidget {
  final bool isLastItem;
  final TestimonialsData? testimonialsData;
  const TestimonialsListItem({super.key, required this.testimonialsData, required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Platform.isIOS ? Sizes.dimen_0.w : Sizes.dimen_12.w, right: (isLastItem && !Platform.isIOS) ? Sizes.dimen_12.w : Sizes.dimen_0.w),
      width: ScreenUtil().screenWidth * 0.20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_2.w),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF97c7ec),
                      Color(0xFFc46c8c),
                      Color(0xFFc9d9da),
                      Color(0xFFd296a8),
                      Color(0xFFfce4cc),
                    ], // Colors in the gradient
                    begin: Alignment.topLeft, // Gradient start point
                    end: Alignment.bottomRight, // Gradient end point
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_4.w),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.vulcan
                  ),
                  child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: testimonialsData?.imageUrl?.split("?").first != null ? NetworkImage("${testimonialsData?.imageUrl?.split("?").first}") : const AssetImage(AssetConstants.mockUser),
                  ),
                ),
              )
          ),
          UIHelper.verticalSpace(Sizes.dimen_2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_4.w),
            child: Text("${testimonialsData?.firstName} ${testimonialsData?.lastName}",
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
