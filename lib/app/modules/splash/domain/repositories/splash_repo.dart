import 'package:unico_app/app/modules/login/data/models/user.dart';
import 'package:unico_app/app/modules/splash/data/models/splash_refresh_token_request_model.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class SplashRepository {
  Future<UserResponse> refreshAccessToken(RefreshTokenRequestModel requestData);
}
