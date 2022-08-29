import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_password_request_model.dart';
import 'package:flutter_template_3/app/modules/register/domain/repositories/register_repo.dart';

///
/// Created by Sunil Kumar
/// On 13-08-2022 10:03 AM
///
class RegisterWithPhonePasswordUseCase
    extends UseCase<UserResponse, RegisterPhonePasswordRequestModel> {
  late final RegisterRepository repository;

  RegisterWithPhonePasswordUseCase(this.repository);

  @override
  Future<UserResponse> call(RegisterPhonePasswordRequestModel params) =>
      repository.registerUsingPhonePassword(params);
}
