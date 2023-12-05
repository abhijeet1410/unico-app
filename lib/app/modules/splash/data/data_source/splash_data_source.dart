import 'package:unico_app/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:unico_app/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class SplashDataSource extends BaseProvider {
  Future<Response> refreshAccessToken(RefreshTokenRequestModel requestData,
      {String? mockPath});
}
