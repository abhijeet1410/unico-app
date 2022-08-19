import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
mixin AppThemes {
  static const String fontFamily = "Roboto";
  static final lightTheme = createTheme(
      brightness: Brightness.light,
      primaryColor: AppColors.brightPrimary,
      backgroundColor: AppColors.brightBackground,
      cardBackgroundColor: AppColors.brightBackground,
      fontFamily: fontFamily,
      appBarActionColor: Colors.black,
      appBarColor: AppColors.brightPrimary,
      appBarElevation: 0,
      appBarTextColor: Colors.white,
      buttonBackground: AppColors.brightPrimary,
      buttonTextColor: Colors.white,
      divider: AppColors.dividerGray,
      errorColor: Colors.red,
      iconColor: Colors.black);
  static final darkTheme = createTheme(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,
      backgroundColor: AppColors.darkBackground,
      cardBackgroundColor: AppColors.darkBackground,
      fontFamily: fontFamily,
      appBarActionColor: Colors.white,
      appBarColor: AppColors.darkPrimary,
      appBarElevation: 0,
      appBarTextColor: Colors.white,
      buttonBackground: AppColors.darkPrimary,
      buttonTextColor: Colors.white,
      divider: AppColors.dividerGray,
      errorColor: Colors.red,
      iconColor: Colors.black);

  static ThemeData createTheme({
    required Brightness brightness,
    required Color backgroundColor,
    required Color cardBackgroundColor,
    required MaterialColor primaryColor,
    Color? divider,
    Color? buttonBackground,
    Color? buttonTextColor,
    Color? errorColor,
    String? fontFamily,
    double? appBarElevation,
    Color? appBarColor,
    Color? appBarTextColor,
    Color? appBarActionColor,
    Color? iconColor,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      brightness: brightness,
      canvasColor: backgroundColor,
      cardColor: backgroundColor,
      primarySwatch: primaryColor,
      primaryColor: primaryColor,
      dividerColor: divider,
      dividerTheme: DividerThemeData(color: divider, space: 1, thickness: 1),
      backgroundColor: backgroundColor,
      cardTheme: CardTheme(
          color: cardBackgroundColor,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias),
      scaffoldBackgroundColor: backgroundColor,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionHandleColor: primaryColor,
          selectionColor: primaryColor.withOpacity(0.3)),
      appBarTheme: AppBarTheme(
        elevation: appBarElevation,
        backgroundColor: appBarColor,
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: fontFamily,
            fontWeight: FontWeight.w700,
            color: appBarTextColor),
        iconTheme: IconThemeData(color: appBarActionColor),
      ),
      iconTheme: IconThemeData(color: iconColor),
      errorColor: errorColor,
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: primaryColor,
      ),
      fontFamily: fontFamily,
    );
  }
}
