import 'package:get/get.dart';

import 'city.dart';

///
/// Created by Sunil Kumar
/// On 09-07-2022 07:41 PM
///

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => List<City>.from(val.map((x) => City.fromJson(x)));
    httpClient.baseUrl = 'https://api.test.kemnu.com';
    super.onInit();
  }

  Future<List<City>> getCities() async {
    final cases = await get("/v1/city");
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}

class HomeController extends SuperController<List<City>> {
  HomeController({required this.homeApiProvider});

  final HomeProvider homeApiProvider;

  @override
  void onInit() {
    super.onInit();
    append(() => homeApiProvider.getCities);
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
