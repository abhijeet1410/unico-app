import 'package:unico_app/app/modules/home/data/data_source/home_data_source.dart';
import 'package:unico_app/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:unico_app/app/route/api_routes.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 14-08-2022 10:44 PM
///
class HomeDataSourceImpl extends HomeDataSource {
  @override
  Future<Response> getCountries({String? mockPath}) {
    return get(AppApiRoutes.country, mockPath: mockPath);
  }
}
