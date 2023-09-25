import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source_impl.dart';
import 'package:flutter_template_3/app/core/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:flutter_template_3/app/modules/splash/domain/usecases/splash_refresh_token_usecase.dart';
import 'package:flutter_template_3/app/route/app_page_routes.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AuthCheckMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig navConfig) async {
    if (AppPageRoutes.noAuthPages.contains(navConfig.currentPage?.name)) {
      return navConfig;
    }
    final PreferenceManager preferenceManager = Get.find<PreferenceManager>();
    final DeviceInfoDataSource deviceInfoSource =
        Get.put<DeviceInfoDataSource>(DeviceInfoDataSourceImpl());
    final info = await deviceInfoSource.getDeviceInfo();
    final userController = Get.isRegistered<UserController>()
        ? Get.find<UserController>()
        : Get.put<UserController>(UserController(), permanent: true);
    final token = preferenceManager.accessToken;
    try {
      if (token != null) {
        if (userController.state == null) {
          RefreshTokenRequestModel refreshTokenRequestModel =
              RefreshTokenRequestModel(
            deviceType: "1",
            deviceId: info?.deviceId ?? "1234",
          );
          final UserResponse res = await Get.find<SplashRefreshTokenUseCase>()
              .call(refreshTokenRequestModel);
          preferenceManager.storeAccessToken(res.accessToken!);
          userController.updateUser(res.user);
        }
        return navConfig;
      } else {
        return GetNavConfig.fromRoute(LoginPage.routeName);
      }
    } catch (e, s) {
      log("Refresh Token Error", stackTrace: s, error: e);
      return GetNavConfig.fromRoute(LoginPage.routeName);
    }
  }
}

class NoAuthCheckMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final preferenceManager = Get.find<PreferenceManager>();
    final userController = Get.find<UserController>();
    final token = preferenceManager.accessToken;
    final user = userController.state;

    if (token != null) {
      if (user == null) {
        return null;
      } else {
        if (user.name.isEmpty) {
          // return const RouteSettings(name: OnBoardingPage.routeName);
        } else {
          userController.updateUser(user);
          return const RouteSettings(name: DashboardPage.routeName);
        }
      }
    } else {
      return null;
    }

    // if (preferenceManager.accessToken == null ||
    //     route == LoginPage.routeName) {}
    // return preferenceManager.accessToken != null || route == LoginPage.routeName
    //     ? null
    //     : const RouteSettings(name: LoginPage.routeName);
  }
}

class ForbiddenMiddleWare extends GetMiddleware {
  final redirectRouteName;

  ForbiddenMiddleWare({this.redirectRouteName = DashboardPage.routeName});

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (route.currentTreeBranch[1].arguments == null) {
      return GetNavConfig.fromRoute(redirectRouteName);
    }
    return route;
  }
}
