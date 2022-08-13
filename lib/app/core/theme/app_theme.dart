import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';

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
//
// static ThemeData createTheme({
//   required Brightness brightness,
//   required Color background,
//   required Color primaryText,
//   Color? secondaryText,
//   required Color accentColor,
//   Color? divider,
//   Color? buttonBackground,
//   required Color buttonText,
//   Color? cardBackground,
//   Color? disabled,
//   required Color error,
// }) {
//   final baseTextTheme = brightness == Brightness.dark
//       ? Typography.blackMountainView
//       : Typography.whiteMountainView;
//
//   return ThemeData(
//     brightness: brightness,
//     canvasColor: background,
//     cardColor: background,
//     dividerColor: divider,
//     dividerTheme: DividerThemeData(
//       color: divider,
//       space: 1,
//       thickness: 1,
//     ),
//     cardTheme: CardTheme(
//       color: cardBackground,
//       margin: EdgeInsets.zero,
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//     ),
//     backgroundColor: background,
//     primaryColor: accentColor,
//
//     textSelectionColor: accentColor,
//     textSelectionHandleColor: accentColor,
//     cursorColor: accentColor,
// textSelectionTheme: TextSelectionThemeData(
//   selectionColor: accentColor,
//   selectionHandleColor: accentColor,
//   cursorColor: accentColor,
// ),
// toggleableActiveColor: accentColor,
// appBarTheme: AppBarTheme(
//   color: cardBackground,
//   iconTheme: IconThemeData(
//     color: secondaryText,
//   ),
// ),
// iconTheme: IconThemeData(
//   color: secondaryText,
//   size: 16.0,
// ),
// errorColor: error,
// buttonTheme: ButtonThemeData(
//   textTheme: ButtonTextTheme.primary,
//   colorScheme: ColorScheme(
//     brightness: brightness,
//     primary: accentColor,
//     primaryVariant: accentColor,
//     secondary: accentColor,
//     secondaryVariant: accentColor,
//     surface: background,
//     background: background,
//     error: error,
//     onPrimary: buttonText,
//     onSecondary: buttonText,
//     onSurface: buttonText,
//     onBackground: buttonText,
//     onError: buttonText,
//   ),
//   padding: const EdgeInsets.all(16.0),
// ),
// cupertinoOverrideTheme: CupertinoThemeData(
//   brightness: brightness,
//   primaryColor: accentColor,
// ),
// inputDecorationTheme: InputDecorationTheme(
//   errorStyle: TextStyle(color: error),
//   labelStyle: TextStyle(
//     fontFamily: fontFamily,
//     fontWeight: FontWeight.w600,
//     fontSize: 16.0,
//     color: primaryText.withOpacity(0.5),
//   ),
//   hintStyle: TextStyle(
//     color: secondaryText,
//     fontSize: 13.0,
//     fontWeight: FontWeight.w300,
//   ),
// ),
// fontFamily: fontFamily,
// unselectedWidgetColor: hexToColor('#DADCDD'),
// textTheme: TextTheme(
//   headline1: baseTextTheme.headline1!.copyWith(
//     color: primaryText,
//     fontSize: 34.0,
//     fontWeight: FontWeight.bold,
//   ),
//   headline2: baseTextTheme.headline2!.copyWith(
//     color: primaryText,
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//   ),
//   headline3: baseTextTheme.headline3!.copyWith(
//     color: secondaryText,
//     fontSize: 20,
//     fontWeight: FontWeight.w600,
//   ),
//   headline4: baseTextTheme.headline4!.copyWith(
//     color: primaryText,
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//   ),
//   headline5: baseTextTheme.headline5!.copyWith(
//     color: primaryText,
//     fontSize: 16,
//     fontWeight: FontWeight.w700,
//   ),
//   headline6: baseTextTheme.headline6!.copyWith(
//     color: primaryText,
//     fontSize: 14,
//     fontWeight: FontWeight.w700,
//   ),
//   bodyText1: baseTextTheme.bodyText1!.copyWith(
//     color: secondaryText,
//     fontSize: 15,
//   ),
//   bodyText2: baseTextTheme.bodyText2!.copyWith(
//     color: primaryText,
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//   ),
//   button: baseTextTheme.button!.copyWith(
//     color: primaryText,
//     fontSize: 12.0,
//     fontWeight: FontWeight.w700,
//   ),
//   caption: baseTextTheme.caption!.copyWith(
//     color: primaryText,
//     fontSize: 11.0,
//     fontWeight: FontWeight.w300,
//   ),
//   overline: baseTextTheme.overline!.copyWith(
//     color: secondaryText,
//     fontSize: 11.0,
//     fontWeight: FontWeight.w500,
//   ),
//   subtitle1: baseTextTheme.subtitle1!.copyWith(
//     color: primaryText,
//     fontSize: 16.0,
//     fontWeight: FontWeight.w700,
//   ),
//   subtitle2: baseTextTheme.subtitle2!.copyWith(
//     color: secondaryText,
//     fontSize: 11.0,
//     fontWeight: FontWeight.w500,
//   ),
// ),
// );
// }
//
// static ThemeData get lightTheme => createTheme(
//       brightness: Brightness.light,
//       background: AppColors.brightBackground,
//       primaryText: Colors.black,
//       secondaryText: Colors.white,
//       accentColor: AppColors.brightPrimary,
//       divider: AppColors.dividerGray,
//       buttonBackground: Colors.black38,
//       buttonText: Colors.white,
//       error: Colors.red,
//     );
//
// static ThemeData get darkTheme => createTheme(
//       brightness: Brightness.dark,
//       background: AppColors.darkBackground,
//       primaryText: Colors.white,
//       secondaryText: Colors.black,
//       divider: Colors.black45,
//       buttonBackground: Colors.white,
//       buttonText: Colors.white,
//       error: Colors.red,
//       accentColor: AppColors.darkprimary,
//     );
// }
//
