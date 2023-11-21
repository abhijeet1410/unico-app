import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

mixin AppColors {
  static const MaterialColor neutralBlue =
      MaterialColor(0xFF8D99A5, <int, Color>{
    50: Color(0xFFF3F5F7),
    100: Color(0xFFF3F5F7),
    200: Color(0xFFE1E6EB),
    300: Color(0xFFD1D9E0),
    400: Color(0xFFA7B3BF),
    500: Color(0xFF8D99A5),
    600: Color(0xFF71808F),
    700: Color(0xFF434C56),
    800: Color(0xFF1B1F22),
    900: Color(0xFF1B1F22),
  });
  static const MaterialColor neutralBlack =
      MaterialColor(0xFF999999, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFE6E6E6),
    300: Color(0xFFCCCCCC),
    400: Color(0xFFB3B3B3),
    500: Color(0xFF999999),
    600: Color(0xFF808080),
    700: Color(0xFF4C4C4C),
    800: Color(0xFF1F1F1F),
    900: Color(0xFF1F1F1F),
  });

  static const MaterialColor red = MaterialColor(0xffEE6F57, <int, Color>{
    50: Color(0xFFFFD4CC),
    100: Color(0xFFFFD4CC),
    200: Color(0xFFF99C8B),
    300: Color(0xFFF99C8B),
    400: Color(0xFFEE6F57),
    500: Color(0xffEE6F57),
    600: Color(0xFFDD3616),
    700: Color(0xFFDD3616),
    800: Color(0xFF94240F),
    900: Color(0xFF94240F),
  });
  static const MaterialColor green = MaterialColor(0xff8FBD60, <int, Color>{
    50: Color(0xFFE5F0DB),
    100: Color(0xFFE5F0DB),
    200: Color(0xFFB4D395),
    300: Color(0xFFB4D395),
    400: Color(0xFF8FBD60),
    500: Color(0xff8FBD60),
    600: Color(0xFF6B973F),
    700: Color(0xFF6B973F),
    800: Color(0xFF48652A),
    900: Color(0xFF48652A),
  });
  static const MaterialColor orange = MaterialColor(0xffFFB54D, <int, Color>{
    50: Color(0xFFFFEACC),
    100: Color(0xFFFFEACC),
    200: Color(0xFFFFCC85),
    300: Color(0xFFFFCC85),
    400: Color(0xFFFFB54D),
    500: Color(0xffFFB54D),
    600: Color(0xFFF99100),
    700: Color(0xFFF99100),
    800: Color(0xFFA66100),
    900: Color(0xFFA66100),
  });

  static const MaterialColor brightPrimary =
      MaterialColor(_brightPrimaryValue, <int, Color>{
    50: Color(0xFFFEDDC9),
    100: Color(0xFFFCBB93),
    200: Color(0xFFFB985C),
    300: Color(0xFFFB985C),
    400: Color(0xFFFA7F34),
    500: Color(_brightPrimaryValue),
    600: Color(0xFFBE4B05),
    700: Color(0xFF9F3E04),
    800: Color(0xFF7F3203),
    900: Color(0xFF3F1902),
  });
  static const int _brightPrimaryValue = 0xFFF9650B;
}
