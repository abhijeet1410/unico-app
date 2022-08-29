import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/splash/data/models/splash_refresh_token_request_model.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class SplashRepository {
  Future<UserResponse> refreshAccessToken(RefreshTokenRequestModel requestData);
}
