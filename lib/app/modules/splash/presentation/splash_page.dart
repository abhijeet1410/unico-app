
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/screen/admin_splash_screen.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static String get routeName => "/splash";
  //
  // late AppSplashController controller;
  // final DeviceInfoDataSource deviceInfoSource =
  //     Get.find<DeviceInfoDataSource>();
  // final SplashRefreshTokenUseCase refreshTokenUseCase =
  //     Get.find<SplashRefreshTokenUseCase>();
  // final UserController userController = Get.find<UserController>();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   controller = AppSplashController();
  //   checkUserLoggedIn();
  //   controller.startLoadingAnimation();
  //   controller.addListener(() {
  //     final state = controller.value;
  //     print("STATE CHANGE=> $state");
  //     if (state == AppSplashStates.noLogin) {
  //       controller.startSuccessAnimation();
  //       Future.delayed(2.seconds, () => Get.offAllNamed(LoginPage.routeName));
  //     } else if (state == AppSplashStates.success) {
  //       controller.startSuccessAnimation();
  //       Future.delayed(2.seconds, () => Get.offAllNamed(IntroPage.routeName));
  //     }
  //   });
  // }
  //
  // void checkUserLoggedIn() async {
  //   await AppNotificationManager.configureInAppNotification();
  //   await AppNotificationManager.requestNotification();
  //   controller.value = AppSplashStates.loading;
  //   final String? token = preference.accessToken;
  //
  //   if (token == null) {
  //     controller.value = AppSplashStates.noLogin;
  //   } else {
  //     final DeviceInfoReqModel? deviceInfo =
  //         await deviceInfoSource.getDeviceInfo();
  //     late RefreshTokenRequestModel loginData = RefreshTokenRequestModel();
  //     loginData.deviceType = deviceInfo?.deviceType;
  //     loginData.deviceId = deviceInfo?.deviceId;
  //     refreshTokenUseCase.call(loginData).then((UserResponse user) {
  //       if (user.user?.status == 1) {
  //         userController.updateUser(user.user);
  //         preference.storeAccessToken(user.accessToken!);
  //         controller.value = AppSplashStates.success;
  //         Get.offAllNamed(IntroPage.routeName);
  //       } else {
  //         showAppAlertDialog(
  //                 title: "Account Blocked",
  //                 description:
  //                     "Unfortunately, Your account is blocked by Admin. Please contact our support for more details.",
  //                 positiveText: "Visit Support",
  //                 negativeText: "Logout",
  //                 barrierDismissible: false)
  //             .then((bool? value) {
  //           if (value == true) {
  //             launchUrl(Uri.parse("https://google.in"),
  //                 mode: LaunchMode.externalApplication);
  //             exit(1);
  //           }
  //           if (value == false) {
  //             preference.clear();
  //             userController.updateUser(null);
  //             controller.value = (AppSplashStates.noLogin);
  //           }
  //         });
  //       }
  //     }).catchError((e, s) {
  //       logger.e("Refresh token Error", e, s);
  //       controller.showErrorMessage(e.toString());
  //     });
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.rootDelegate,
      builder: (BuildContext context, GetDelegate delegate,
          GetNavConfig? currentRoute) {
        return AdminSplashScreen();
      },
    );
  }
}
/*
AppSplashPage(
      controller: controller,
      logoAnimationPath: AppAnimations.splash,
      backgroundColor: Colors.white,
      // loaderWidget: CircularProgressIndicator(),
    )
*?
 */
