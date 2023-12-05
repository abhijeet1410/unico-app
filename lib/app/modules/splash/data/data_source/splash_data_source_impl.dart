import 'package:unico_app/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:unico_app/app/route/api_routes.dart';
import 'package:get/get.dart';
import 'package:unico_app/app/modules/splash/data/data_source/splash_data_source.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class SplashDataSourceImpl extends SplashDataSource {
  @override
  Future<Response> refreshAccessToken(RefreshTokenRequestModel requestData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.authenticateJwt,
      requestData.toJson(),
      mockPath: mockPath,
      authRequired: true,
    );
  }
}
