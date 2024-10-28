

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miles_education/src/config/extensions/size_extensions.dart';

import '../config/constants/size_constants.dart';
import '../presentation/theme/theme_color.dart';

class FlashHelper {

  static showToastMessage(BuildContext context, {required String message, bool shouldDelay = true}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColor.grey,
        textColor: AppColor.white,
        fontSize: Sizes.dimen_14.sp
    );
  }

}