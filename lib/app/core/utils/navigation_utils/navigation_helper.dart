import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

///
/// Created By Sambit <sambit@smartters.in> on 29-06-2023 at 15:19.
///

class NavigationHelper {
  static Future toNamed(
    String page, {
    dynamic arguments,
    Map<String, String>? parameters,
    bool preventDuplicates = true,
  }) async {
    return Get.rootDelegate.toNamed(
      page,
      arguments: arguments,
      parameters: parameters,
    );
  }

  static Future offNamed(
    String page, {
    dynamic arguments,
    Map<String, String>? parameters,
    bool preventDuplicates = true,
  }) async {
    return Get.rootDelegate.offNamed(
      page,
      arguments: arguments,
      parameters: parameters,
    );
  }

  static void offAllNamed(String routeName) {
    Get.rootDelegate.offNamed(routeName);
  }

  static void back() {
    Get.rootDelegate.popRoute(popMode: PopMode.History);
  }
}
