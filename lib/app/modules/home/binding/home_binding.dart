import 'package:get/get.dart';

import '../provider/home_api_provider.dart';
import '../controller/home_controller.dart';

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
}
