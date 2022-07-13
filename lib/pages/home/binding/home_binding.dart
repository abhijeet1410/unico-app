import 'package:flutter_template_3/pages/home/controller/home_controller.dart';
import 'package:flutter_template_3/pages/home/provider/home_api_provider.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 05:15 PM
///
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeApiProvider());
    Get.lazyPut(() => HomeController(Get.find<HomeApiProvider>()));
  }
  // @override
  // List<Bind> dependencies() {
  //   return [
  //     Bind.put(HomeApiProvider()),
  //     Bind.lazyPut(() => HomeController(Bind.find<HomeApiProvider>())),
  //   ];
  // }
}
