import 'package:flutter/material.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:flutter_template_3/flavors/build_config.dart';

abstract class BaseWidget extends StatelessWidget {
  BaseWidget({Key? key}) : super(key: key);

  S get appLocalization => S.of(Get.context!);
  final Logger logger = BuildConfig.instance.config.logger;

  ThemeData get theme => Get.theme;
  Size get size => Get.size;
  double get height => Get.height;
  double get width => Get.width;
  bool get isDark => Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context);
}
