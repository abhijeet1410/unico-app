import 'dart:developer';

import 'package:flutter_template_3/models/city.dart';
import 'package:flutter_template_3/pages/home/provider/home_api_provider.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 05:02 PM
///
class HomeController extends GetxController with StateMixin<List<City>> {
  HomeController(this.provider);
  final HomeApiProvider provider;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future loadData() async {
    append(() => provider.getCountries);
    try {
      await provider.getCountries();
    } catch (e, s) {
      log("ERROR ", error: e, stackTrace: s);
    }
  }
}
