import 'package:flutter/material.dart';

///
/// Created by Kumar Sunil on 21-06-2023
///
class AppIntroSliderData {
  Widget asset;
  String? title;
  String? description;

  AppIntroSliderData({required this.asset, this.title, this.description});
}

class AppIntroOptions {
  Widget? logo;
  Widget? action;
  VoidCallback? onFinish;
  int currentIndex;
  Function(int)? onPageChange;
  List<AppIntroSliderData> introData;
  AppIntroOptions(
      {this.logo,
      this.introData = const <AppIntroSliderData>[],
      this.action,
      this.onFinish,
      this.onPageChange,
      this.currentIndex =
          0}); //: assert(logo != null && logoAnimationPath != null);
}