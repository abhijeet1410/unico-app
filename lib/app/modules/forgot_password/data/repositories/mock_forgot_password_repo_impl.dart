import 'package:flutter_template_3/app/modules/forgot_password/data/data_source/forgot_password_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password/domain/repositories/forgot_pass_repo.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';

///
/// Created by Sisira Sahoo
/// On 17/08/22 6:20 PM
///
class MockForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordDataSource _remoteSource;

  MockForgotPasswordRepositoryImpl(this._remoteSource);

  @override
  Future<UserResponse> forgotPassword(LoginRequestModel forgotData) async {
    final response =
        await _remoteSource.forgotPassword(forgotData, mockPath: "forgot");
    return UserResponse.fromJson(response.body);
  }
}
