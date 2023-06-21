import 'package:flutter/material.dart';

///
/// Created by Kumar Sunil on 21-06-2023
///
enum AppSplashStates { init, ready, loading, error, success, noLogin }

class AppSplashController extends ValueNotifier<AppSplashStates> {
  AppSplashController({AppSplashStates? state})
      : super(state ?? AppSplashStates.init);
}
