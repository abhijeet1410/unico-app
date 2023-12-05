import 'package:unico_app/app/modules/login/data/models/login_request_model.dart';
import 'package:unico_app/app/modules/login/data/models/user.dart';
import 'package:unico_app/app/core/domain/usercases/usecase.dart';
import 'package:unico_app/app/modules/login/domain/repositories/login_repo.dart';

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
