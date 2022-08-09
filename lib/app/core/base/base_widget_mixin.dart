import 'package:flutter/material.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:flutter_template_3/flavors/build_config.dart';

mixin BaseWidgetMixin on StatelessWidget {
  S get appLocalization => S.of(Get.context!);
  final Logger logger = BuildConfig.instance.config.logger;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(context),
    );
  }

  Widget body(BuildContext context);
}
