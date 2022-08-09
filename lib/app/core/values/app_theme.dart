import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/values/app_colors.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
mixin AppThemes {
  static const String fontFamily = "Roboto";
  static final lightTheme = ThemeData(
      canvasColor: AppColors.brightBackground,
      primarySwatch: AppColors.brightPrimary,
      primaryColor: AppColors.brightPrimary,
      backgroundColor: AppColors.brightBackground,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.brightPrimary,
        selectionHandleColor: AppColors.brightPrimary,
        selectionColor: AppColors.brightPrimary.withOpacity(0.3),
      ),
      fontFamily: fontFamily,
      bannerTheme: const MaterialBannerThemeData(
        backgroundColor: AppColors.brightPrimary,
        contentTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: "",
            backgroundColor: Colors.white,
            height: 12,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            letterSpacing: 1.2,
            decorationStyle: TextDecorationStyle.double,
            decorationColor: Colors.white24,
            decorationThickness: 1.2,
            shadows: [
              Shadow(
                  color: Colors.white24, offset: Offset(0, 1), blurRadius: 12),
            ],
            wordSpacing: 2,
            locale: Locale("en")),
        elevation: 0,
        leadingPadding: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        elevation: 2,
      ),
      iconTheme: IconThemeData(color: Colors.black, size: 12, opacity: 0.5),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Color(0xff161616),
            fontSize: 18,
            fontWeight: FontWeight.w500),
        backgroundColor: AppColors.brightPrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        selectedIconTheme: null,
        selectedItemColor: null,
        selectedLabelStyle: null,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: null,
        unselectedIconTheme: null,
        unselectedItemColor: null,
        type: BottomNavigationBarType.fixed,
      ),
      bottomAppBarColor: Colors.white,
      textTheme: TextTheme(
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        bodySmall: TextStyle(),
        displayLarge: TextStyle(),
        displaySmall: TextStyle(),
        displayMedium: TextStyle(),
        headlineLarge: TextStyle(),
        headlineMedium: TextStyle(),
        headlineSmall: TextStyle(),
        labelLarge: TextStyle(),
        labelMedium: TextStyle(),
        labelSmall: TextStyle(),
        titleLarge: TextStyle(),
        titleMedium: TextStyle(),
        titleSmall: TextStyle(),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.none,
          ),
        ),
        modalElevation: 0,
        clipBehavior: Clip.antiAlias,
        modalBackgroundColor: Colors.white,
      )

      // textTheme: TextTheme(
      //   bodyText1:
      //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
      //   bodyText2:
      //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
      // ),
      );
  static final darkTheme = ThemeData(
      canvasColor: AppColors.darkBackground,
      backgroundColor: AppColors.darkBackground,
      primarySwatch: AppColors.darkprimary,
      primaryColor: AppColors.darkprimary,
      accentColor: AppColors.darkprimary,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.darkprimary,
          selectionHandleColor: AppColors.darkprimary,
          selectionColor: AppColors.brightPrimary.withOpacity(0.3)),
      iconTheme: IconThemeData(color: Colors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      )
      // textTheme: TextTheme(
      //   bodyText1:
      //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
      //   bodyText2:
      //       TextStyle(color: Color(0xff2A2A2A), fontFamily: 'Rubik'),
      // ),
      );
}
