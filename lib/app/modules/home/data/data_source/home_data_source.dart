import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 14-08-2022 10:44 PM
///
abstract class HomeDataSource extends BaseProvider {
  Future<Response> getCountries({String? mockPath});
}
