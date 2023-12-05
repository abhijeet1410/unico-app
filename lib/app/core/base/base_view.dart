import 'package:flutter/material.dart';
import 'package:unico_app/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:unico_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:unico_app/app/core/base/base_controller.dart';
import 'package:unico_app/flavors/build_config.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  S get appLocalization => S.of(Get.context!);

  Logger get logger => BuildConfig.instance.config.logger;

  const BaseView({Key? key}) : super(key: key);

  Widget body(BuildContext context);

  ThemeData get theme => Get.theme;
  Size get size => Get.size;
  double get height => Get.height;
  double get width => Get.width;
  bool get isDarkMode => Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  void showToast(String message) {
    AppSnackBarUtil.show(message);
  }
}
