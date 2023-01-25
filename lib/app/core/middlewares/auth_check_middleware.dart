import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AuthCheckMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final preferenceManager = Get.find<PreferenceManager>();
    final userController = Get.find<UserController>();
    final token = preferenceManager.accessToken;
    final user = userController.state;

    if (token != null) {
      if (user == null) {
        return const RouteSettings(name: LoginPage.routeName);
      } else {
        if (user.name.isEmpty) {
          // return const RouteSettings(name: OnBoardingPage.routeName);
        } else {
          userController.updateUser(user);
          // const RouteSettings(name: DashboardPage.routeName);
          return null;
        }
      }
    } else {
      return const RouteSettings(name: LoginPage.routeName);
    }

    // if (preferenceManager.accessToken == null ||
    //     route == LoginPage.routeName) {}
    // return preferenceManager.accessToken != null || route == LoginPage.routeName
    //     ? null
    //     : const RouteSettings(name: LoginPage.routeName);
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
