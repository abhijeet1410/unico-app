import 'package:flutter_template_3/app/modules/login/data/models/login_otp_response.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
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
