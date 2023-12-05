import 'dart:async';
import 'package:unico_app/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:unico_app/app/core/local/preference/preference_manager.dart';
import 'package:unico_app/app/modules/login/presentation/controller/user_controller.dart';
import 'package:unico_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:unico_app/flavors/build_config.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class BaseController<T> extends SuperController<T> {
  int skip = 0;
  int limit = 20;
  bool shouldLoadMore = true;
  final Map<String, dynamic>? arguments = Get.arguments;
  final Map<String, String?>? parameters = Get.parameters;

  S get appLocalization => S.of(Get.context!);

  Logger get logger => BuildConfig.instance.config.logger;

  final PreferenceManager preference = Get.find<PreferenceManager>();
  UserController get userController => Get.find<UserController>();
  Future loadData() async {}

  Future loadMoreData() async {}

  void showToast(String message) {
    AppSnackBarUtil.show(message);
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  @override
  void onHidden() {}
}
