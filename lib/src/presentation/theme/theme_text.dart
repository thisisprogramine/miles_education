import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miles_education/src/config/extensions/size_extensions.dart';

import '../../config/constants/size_constants.dart';
import 'theme_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _effraTextTheme => GoogleFonts.robotoTextTheme();

  static TextStyle? get _displayLarge =>
      _effraTextTheme.displayLarge?.copyWith(
        fontSize: Sizes.dimen_72.sp,
        color: AppColor.white,
      );

  static TextStyle? get _displayMedium =>
      _effraTextTheme.displayMedium?.copyWith(
        fontSize: Sizes.dimen_60.sp,
        color: AppColor.white,
      );

  static TextStyle? get _displaySmall =>
      _effraTextTheme.displaySmall?.copyWith(
        fontSize: Sizes.dimen_48.sp,
        color: AppColor.white,
      );

  static TextStyle? get _headlineLarge =>
      _effraTextTheme.headlineLarge?.copyWith(
        fontSize: Sizes.dimen_36.sp,
        color: AppColor.white,
      );

  static TextStyle? get _headlineMedium =>
      _effraTextTheme.headlineMedium?.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: AppColor.white,
      );

  static TextStyle? get _headlineSmall =>
      _effraTextTheme.headlineSmall?.copyWith(
        fontSize: Sizes.dimen_21.sp,
        color: AppColor.white,
      );

  static TextStyle? get _titleLarge =>
      _effraTextTheme.titleLarge?.copyWith(
        fontSize: Sizes.dimen_18.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _titleMedium =>
      _effraTextTheme.titleMedium?.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _titleSmall =>
      _effraTextTheme.titleSmall?.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _bodyLarge =>
      _effraTextTheme.bodyLarge?.copyWith(
        fontSize: Sizes.dimen_12.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _bodyMedium =>
      _effraTextTheme.bodyMedium?.copyWith(
        fontSize: Sizes.dimen_11.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _bodySmall =>
      _effraTextTheme.bodySmall?.copyWith(
        fontSize: Sizes.dimen_10.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _labelLarge =>
      _effraTextTheme.labelLarge?.copyWith(
        fontSize: Sizes.dimen_9.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _labelMedium =>
      _effraTextTheme.labelMedium?.copyWith(
        fontSize: Sizes.dimen_8.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _labelSmall =>
      _effraTextTheme.labelSmall?.copyWith(
        fontSize: Sizes.dimen_6.sp,
        color: AppColor.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        displaySmall: _displaySmall,
        headlineLarge: _headlineLarge,
        headlineMedium: _headlineMedium,
        headlineSmall: _headlineSmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        labelLarge: _labelLarge,
        labelMedium: _labelMedium,
        labelSmall: _labelSmall,
      );

}

extension ThemeTextExtension on TextTheme {
  TextStyle? get greyCaption => titleMedium?.copyWith(color: AppColor.grey, fontSize: Sizes.dimen_14.sp);

  TextStyle? get buttonStyle => labelLarge?.copyWith(color: AppColor.vulcan, fontSize: Sizes.dimen_22.sp);
}
