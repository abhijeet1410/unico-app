import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class LoginWithPhonePasswordUseCase
    extends UseCase<UserResponse, LoginRequestModel> {
  late final LoginRepository loginRepository;

  LoginWithPhonePasswordUseCase(this.loginRepository);

  @override
  Future<UserResponse> call(LoginRequestModel params) =>
      loginRepository.loginWithPhonePassword(params);
}
