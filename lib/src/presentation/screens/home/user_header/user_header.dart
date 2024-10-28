
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/strings_constants.dart';

import '../../../../config/constants/size_constants.dart';
import '../../../../utilities/ui_helper.dart';
import '../../../widget/button_talk_to_us.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenUtil().screenHeight * 0.10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIHelper.verticalSpace(Sizes.dimen_4.h),
                      Text(StringConstants.goodMorning, style: Theme.of(context).textTheme.headlineSmall,),
                      Text(StringConstants.siddhant, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const ButtonTalkToUs()
              ],
            ),
          ),
        ),
        UIHelper.verticalSpaceSmall
      ],
    );
  }
}
