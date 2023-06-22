import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/base/base_page.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source.dart';
import 'package:flutter_template_3/app/core/models/device_info_req_model.dart';
import 'package:flutter_template_3/app/core/pages/splash/models/splash_options.dart';
import 'package:flutter_template_3/app/core/pages/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification.dart';
import 'package:flutter_template_3/app/core/widgets/alerts/alert_dialog.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/intro/presentation/intro_page.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:flutter_template_3/app/modules/splash/domain/usecases/splash_refresh_token_usecase.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class SplashPage extends BasePage {
  const SplashPage({Key? key}) : super(key: key);

  static String get routeName => "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage> {
  AppSplashController controller = AppSplashController();
  final DeviceInfoDataSource deviceInfoSource =
      Get.find<DeviceInfoDataSource>();
  final SplashRefreshTokenUseCase refreshTokenUseCase =
      Get.find<SplashRefreshTokenUseCase>();
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
    controller.addListener(() {
      final state = controller.value;
      print("STATE CHANGE=> $state");
      if (state == AppSplashStates.noLogin) {
        Get.offAllNamed(LoginPage.routeName);
      } else if (state == AppSplashStates.success) {
        Get.offAllNamed(IntroPage.routeName);
      }
    });
  }

  void checkUserLoggedIn() async {
    await AppNotificationManager.configureInAppNotification();
    await AppNotificationManager.requestNotification();
    controller.value = AppSplashStates.loading;
    final String? token = preference.accessToken;

    if (token == null) {
      controller.value = (AppSplashStates.noLogin);
    } else {
      final DeviceInfoReqModel? deviceInfo =
          await deviceInfoSource.getDeviceInfo();
      late RefreshTokenRequestModel loginData = RefreshTokenRequestModel();
      loginData.deviceType = deviceInfo?.deviceType;
      loginData.deviceId = deviceInfo?.deviceId;
      refreshTokenUseCase.call(loginData).then((UserResponse user) {
        if (user.user?.status == 1) {
          userController.updateUser(user.user);
          preference.storeAccessToken(user.accessToken!);
          controller.value = (AppSplashStates.success);
        } else {
          showAppAlertDialog(
                  title: "Account Blocked",
                  description:
                      "Unfortunately, Your account is blocked by Admin. Please contact our support for more details.",
                  positiveText: "Visit Support",
                  negativeText: "Logout",
                  barrierDismissible: false)
              .then((bool? value) {
            if (value == true) {
              launchUrl(Uri.parse("https://google.in"),
                  mode: LaunchMode.externalApplication);
              exit(1);
            }
            if (value == false) {
              preference.clear();
              userController.updateUser(null);
              controller.value = (AppSplashStates.noLogin);
            }
          });
        }
      }).catchError((e, s) {
        logger.e("Refresh token Error", e, s);
        controller.value = (AppSplashStates.error);
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppSplashPage(
      controller: controller,
      logoAnimationPath: AppAnimations.splash,
      backgroundColor: Colors.white,
      // loaderWidget: CircularProgressIndicator(),
    );
  }
}
