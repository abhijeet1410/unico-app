import 'dart:developer';

import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_template_3/app/core/base/base_controller.dart';
import 'package:flutter_template_3/app/core/base/base_view.dart';
import 'package:flutter_template_3/app/core/base/base_widget_mixin.dart';
 import 'package:flutter_template_3/app/core/domain/entities/request.dart';
import 'package:flutter_template_3/app/modules/home/data/models/city.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter_template_3/app/modules/home/domain/usecases/home_countries_usecase.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/src/logger.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 05:02 PM
///
class HomeController extends BaseController<List<City>> {
  final countriesUseCase = Get.find<HomeCountriesUseCase>();
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  Future loadData() async {
    try {
      change(null, status: RxStatus.loading());
      final data = await countriesUseCase.call(NoRequest());
      if (data.isEmpty) {
        change(data, status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
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
  Future loadMoreData() async {}
}
