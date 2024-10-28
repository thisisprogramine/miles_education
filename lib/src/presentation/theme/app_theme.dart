
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:miles_education/src/config/extensions/size_extensions.dart';
import 'package:miles_education/src/presentation/theme/theme_color.dart';
import 'package:miles_education/src/presentation/theme/theme_text.dart';

import '../../config/constants/size_constants.dart';

class AppTheme {
  AppTheme._();

  static material.ThemeData getAppDarkTheme({required material.BuildContext context, bool isIpad = false}) {
    return material.ThemeData(
      unselectedWidgetColor: AppColor.secondary,
      primaryColor: AppColor.primary,
      colorScheme: material.ColorScheme.fromSwatch().copyWith(
          secondary: AppColor.secondary,
          primary: AppColor.primary,
          brightness: material.Brightness.light),
      scaffoldBackgroundColor: AppColor.vulcan,
      cardTheme: const material.CardTheme(
        // color: AppColor.white.withOpacity(0.1),
        color: AppColor.lightGrey,
      ),
      visualDensity: material.VisualDensity.adaptivePlatformDensity,
      textTheme: ThemeText.getTextTheme(),
      drawerTheme: const material.DrawerThemeData(
        backgroundColor: AppColor.vulcan
      ),
      popupMenuTheme: const material.PopupMenuThemeData(
        color: AppColor.onVulcan,
        elevation: 2
      ),
      listTileTheme: const material.ListTileThemeData(
        iconColor: AppColor.primary,
      ),
      iconTheme: const material.IconThemeData(
        color: AppColor.primary
      ),
      appBarTheme: const material.AppBarTheme(
        elevation: 0,
        color: AppColor.vulcan,
        iconTheme: material.IconThemeData(
            color: AppColor.white
        ),
      ),
      inputDecorationTheme: material.InputDecorationTheme(
        errorMaxLines: 2,
        contentPadding: material.EdgeInsets.symmetric(vertical: Sizes.dimen_4.h, horizontal: Sizes.dimen_18.w),
        hintStyle: material.Theme.of(context).textTheme.greyCaption,
        prefixStyle: material.Theme.of(context).textTheme.greyCaption,
        errorStyle: material.Theme.of(context).textTheme.bodySmall?.copyWith(color: material.Colors.red, fontSize: Sizes.dimen_10.sp),
        labelStyle: material.Theme.of(context).textTheme.bodySmall,
        alignLabelWithHint: true,
        border: material.OutlineInputBorder(
          borderRadius: material.BorderRadius.circular(Sizes.dimen_6),
          borderSide: const material.BorderSide(
            color: AppColor.white,
          ),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(Sizes.dimen_6),
        //   borderSide: const BorderSide(
        //     color: AppColor.white,
        //   ),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(Sizes.dimen_6),
        //   borderSide: const BorderSide(
        //     color: AppColor.white,
        //   ),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(Sizes.dimen_6),
        //   borderSide: const BorderSide(
        //       color: Colors.red
        //   ),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(Sizes.dimen_6),
        //   borderSide: const BorderSide(
        //     color: AppColor.white,
        //   ),
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(Sizes.dimen_6),
        //   borderSide: const BorderSide(
        //     color: AppColor.white,
        //   ),
        // ),
        focusedBorder: material.InputBorder.none,
        focusedErrorBorder: material.InputBorder.none,
        errorBorder: material.InputBorder.none,
        enabledBorder: material.InputBorder.none,
        disabledBorder: material.InputBorder.none,

      ),
    );
  }


}
