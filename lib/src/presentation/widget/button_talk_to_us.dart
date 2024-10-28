
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/constants/asset_constants.dart';
import 'package:miles_education/src/config/constants/size_constants.dart';
import 'package:miles_education/src/config/constants/strings_constants.dart';
import 'package:miles_education/src/config/extensions/size_extensions.dart';
import 'package:miles_education/src/utilities/ui_helper.dart';

import '../theme/theme_color.dart';

class ButtonTalkToUs extends StatefulWidget {
  const ButtonTalkToUs({super.key});

  @override
  State<ButtonTalkToUs> createState() => _ButtonTalkToUsState();
}

class _ButtonTalkToUsState extends State<ButtonTalkToUs> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColor.vulcan,
              context: context,
              builder: (context) {
                return SizedBox(
                  height: ScreenUtil().screenHeight * 0.30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w,),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w, vertical: Sizes.dimen_4.h),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(StringConstants.close,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColor.primary),
                                  )
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(StringConstants.helpTitle,
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceSmall,
                        Row(
                          children: [
                            Expanded(
                              child: Text(StringConstants.helpDescription,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        },
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AssetConstants.button, width: ScreenUtil().screenWidth * 0.30, ),
            Container(
              height: Sizes.dimen_26,
              width: Sizes.dimen_26,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF140E4B)
              ),
            ),
            Text(StringConstants.talkToUs, style: Theme.of(context).textTheme.titleSmall,)
          ],
        )
    );
  }
}

