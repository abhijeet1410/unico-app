import 'package:unico_app/app/modules/login/data/data_source/login_data_source.dart';
import 'package:unico_app/app/modules/login/data/models/login_request_model.dart';
import 'package:unico_app/app/modules/login/data/models/user.dart';
import 'package:unico_app/app/modules/login/domain/repositories/login_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class MockLoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _remoteSource;

  MockLoginRepositoryImpl(this._remoteSource);

  @override
  Future<UserResponse> loginWithPhonePassword(
      LoginRequestModel loginData) async {
    final response = await _remoteSource.loginWithPhonePassword(loginData,
        mockPath: 'login');
    return UserResponse.fromJson(response.body);
  }
}
