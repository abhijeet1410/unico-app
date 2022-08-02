import 'package:flutter_template_3/configs/api_configs/api.dart';
import 'package:flutter_template_3/models/city.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 05:03 PM
///
class HomeApiProvider extends BaseProvider {
  Future<List<City>> getCountries() async {
    final res = await get<List<City>>(AppApiRoutes.user);
    if (res.hasError) {
      return Future.error(res.statusText!);
    } else {
      return res.body!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (val) {
      print("VALUE ${val.runtimeType}");
      return List<City>.from(val["data"].map((x) => City.fromJson(x)));
    };
  }

  @override
  bool get isMock => true;
}
