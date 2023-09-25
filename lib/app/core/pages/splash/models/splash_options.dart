import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

///
/// Created by Kumar Sunil on 21-06-2023
///
enum AppSplashStates { init, ready, loading, error, success, noLogin }

class AppSplashController extends ValueNotifier<AppSplashStates> {
  Artboard? riveArtboard;
  String? logoAnimationPath;
  String? errorMessage;

  AppSplashController({this.logoAnimationPath, AppSplashStates? state})
      : super(state ?? AppSplashStates.init) {
    initAnimation();
  }

  Future<void> initAnimation() async {
    if (logoAnimationPath == null) return;
    final ByteData data = await rootBundle.load(logoAnimationPath!);
    final RiveFile file = RiveFile.import(data);
    riveArtboard = file.mainArtboard;
    value = AppSplashStates.ready;
  }

  void startLoadingAnimation() async {
    if (logoAnimationPath == null) return;
    if (riveArtboard == null) await initAnimation();
    final StateMachineController? l =
        StateMachineController.fromArtboard(riveArtboard!, 'Loading');
    if (l != null) {
      riveArtboard!.addController(l);
    }
  }

  void startSuccessAnimation() {
    final StateMachineController? l =
        StateMachineController.fromArtboard(riveArtboard!, 'Finish');
    if (l != null) {
      riveArtboard?.addController(l);
    }
  }

  void showErrorMessage([String? message = "Some error occurred"]) {
    value = AppSplashStates.error;
    errorMessage = message;
  }
}
