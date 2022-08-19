import 'dart:async';

import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:flutter_template_3/flavors/build_config.dart';

abstract class BaseController<T> extends SuperController<T> {
  int skip = 0;
  int limit = 20;
  bool shouldLoadMore = true;
  final Map<String, dynamic> arguments = Get.arguments;
  final Map<String, String?> parameters = Get.parameters;

  final Logger logger = BuildConfig.instance.config.logger;

  S get appLocalization => S.of(Get.context!);

  Future loadData();

  Future loadMoreData();
}
