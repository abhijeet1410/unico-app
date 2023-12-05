
import 'package:unico_app/app/core/base/base_controller.dart';
import 'package:unico_app/app/modules/home/data/models/city.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 05:02 PM
///
class HomeController extends BaseController<List<City>> {
  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}
