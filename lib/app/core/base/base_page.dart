import 'package:flutter/material.dart';
import 'package:unico_app/app/core/local/preference/preference_manager.dart';
import 'package:unico_app/flavors/build_config.dart';
import 'package:unico_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  S get appLocalization => S.of(Get.context!);

  Logger get logger => BuildConfig.instance.config.logger;

  final PreferenceManager preference = Get.find<PreferenceManager>();

  @override
  Widget build(BuildContext context);
}
