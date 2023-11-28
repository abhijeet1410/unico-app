import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

mixin AppThemes {
  static const String fontFamily = "IBMPlexSans";
  static final lightTheme = createTheme(
      brightness: Brightness.light,
      primaryColor: AppColors.brightPrimary,
      backgroundColor: AppColors.neutralBlue.shade100,
      cardBackgroundColor: AppColors.neutralBlack.shade100,
      fontFamily: fontFamily,
      appBarActionColor: Colors.black,
      appBarColor: Colors.transparent, //.brightPrimary,
      appBarElevation: 0,
      appBarTextColor: Colors.black,
      buttonBackground: AppColors.brightPrimary,
      buttonTextColor: Colors.white,
      divider: AppColors.neutralBlue.shade300,
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
        useMaterial3: false,
        brightness: brightness,
        canvasColor: backgroundColor,
        cardColor: backgroundColor,
        primarySwatch: primaryColor,
        primaryColor: primaryColor,
        dividerColor: divider,
        dividerTheme: DividerThemeData(color: divider, space: 1, thickness: 1),
        cardTheme: CardTheme(
            color: cardBackgroundColor,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias),
        scaffoldBackgroundColor: backgroundColor,
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
            selectionHandleColor: primaryColor,
            selectionColor: primaryColor.withOpacity(0.3)),
        tabBarTheme: TabBarTheme(
          indicatorColor: primaryColor,
          labelColor: Color(0xff373737),
          unselectedLabelColor: Color(0xff343434),
        ),
        appBarTheme: AppBarTheme(
          elevation: appBarElevation,
          backgroundColor: appBarColor,
          titleTextStyle: TextStyle(
              fontSize: 16,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w600,
              color: appBarTextColor),
          iconTheme: IconThemeData(color: appBarActionColor),
        ),
        iconTheme: IconThemeData(color: iconColor),
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: brightness,
          primaryColor: primaryColor,
        ),
        fontFamily: fontFamily,
        colorScheme: ColorScheme.light(
          error: errorColor ?? Colors.red,
          background: backgroundColor,
        ));
  }
}
