

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_education/src/config/extensions/size_extensions.dart';
import 'package:miles_education/src/presentation/theme/theme_color.dart';
import 'package:miles_education/src/presentation/theme/theme_text.dart';

import '../../config/constants/size_constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const ValueKey('main_button'),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.vulcan,
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
      ),
      onPressed: onPressed,
      child: Container(
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.only(top: Sizes.dimen_3.h, bottom: Sizes.dimen_5.h),
          child: Center(
            child: Text(text, style: Theme.of(context).textTheme.buttonStyle?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor)),
          )
      ),
    );
  }
}
