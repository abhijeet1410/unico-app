import 'package:unico_app/app/modules/login/data/models/user.dart';
import 'package:unico_app/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:unico_app/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:unico_app/app/modules/splash/domain/repositories/splash_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class MockSplashRepositoryImpl implements SplashRepository {
  final SplashDataSource _remoteSource;

  MockSplashRepositoryImpl(this._remoteSource);

  @override
  Future<UserResponse> refreshAccessToken(
      RefreshTokenRequestModel requestData) async {
    final response =
        await _remoteSource.refreshAccessToken(requestData, mockPath: 'login');
    return UserResponse.fromJson(response.body);
  }
}
