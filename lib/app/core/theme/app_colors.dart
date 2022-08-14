import 'package:flutter/material.dart';

mixin AppColors {
  static const brightBackground = Color(0xfff8f8f8);
  static const darkBackground = Color(0xff3e3e3e);
  static const dividerGray = Color(0xFFF6F6F6);

  static const MaterialColor brightPrimary =
      MaterialColor(_brightPrimaryValue, <int, Color>{
    50: Color(0xFFE0F8FF),
    100: Color(0xFFB3EEFE),
    200: Color(0xFF80E3FD),
    300: Color(0xFF4DD7FC),
    400: Color(0xFF26CFFC),
    500: Color(_brightPrimaryValue),
    600: Color(0xFF00C0FA),
    700: Color(0xFF00B9FA),
    800: Color(0xFF00B1F9),
    900: Color(0xFF00A4F8),
  });
  static const int _brightPrimaryValue = 0xFF00C6FB;

  static const MaterialColor darkprimary =
      MaterialColor(_darkprimaryPrimaryValue, <int, Color>{
    50: Color(0xFFFFE1E9),
    100: Color(0xFFFFB5C7),
    200: Color(0xFFFF84A2),
    300: Color(0xFFFF527C),
    400: Color(0xFFFF2D60),
    500: Color(_darkprimaryPrimaryValue),
    600: Color(0xFFFF073E),
    700: Color(0xFFFF0635),
    800: Color(0xFFFF042D),
    900: Color(0xFFFF021F),
  });
  static const int _darkprimaryPrimaryValue = 0xFFFF0844;
}
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}