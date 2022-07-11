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

  Future<Response<List<City>>> getCities() => get("/v1/city");
}

class HomeRepository {
  HomeRepository({required this.provider});
  final HomeProvider provider;

  Future<List<City>> getCities() async {
    final cases = await provider.getCities();
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}

class HomeController extends SuperController<List<City>> {
  HomeController({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();
    append(() => homeRepository.getCities);
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
