import 'package:flutter_template_3/app/modules/forgot_password/data/data_source/forgot_password_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password/domain/repositories/forgot_pass_repo.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RemoteForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordDataSource _remoteSource;

  RemoteForgotPasswordRepositoryImpl(this._remoteSource);

  @override
  Future<UserResponse> forgotPassword(LoginRequestModel forgotData) async {
    final response = await _remoteSource.forgotPassword(forgotData);
    return UserResponse.fromJson(response.body);
  }
}
