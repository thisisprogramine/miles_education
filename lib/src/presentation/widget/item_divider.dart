
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/size_constants.dart';
import 'package:miles_education/src/utilities/ui_helper.dart';

class ItemDivider extends StatelessWidget {
  final String? title;
  const ItemDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w, vertical: Sizes.dimen_8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Text(title ?? '--', style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    height: Sizes.dimen_1.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF000000),
                          Color(0xFFFFA548),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    ),
                  ),
                ),
                UIHelper.horizontalSpaceSmall,
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Sizes.dimen_1.h,
                    color: const Color(0xFFFFA548),
                  ),
                ),
                UIHelper.horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Container(
                    height: Sizes.dimen_1.h,
                    color: const Color(0xFFFFA548),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
