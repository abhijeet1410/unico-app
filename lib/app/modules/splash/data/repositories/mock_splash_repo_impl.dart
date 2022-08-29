import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:flutter_template_3/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:flutter_template_3/app/modules/splash/domain/repositories/splash_repo.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class MockSplashRepositoryImpl implements SplashRepository {
  final SplashDataSource _remoteSource;

  MockSplashRepositoryImpl(this._remoteSource);

  @override
  Future<UserResponse> refreshAccessToken(
      RefreshTokenRequestModel requestData) async {
    final response =
        await _remoteSource.refreshAccessToken(requestData, mockPath: 'user');
    return response.body;
  }
}
