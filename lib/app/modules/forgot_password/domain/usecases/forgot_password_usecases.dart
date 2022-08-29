import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/forgot_password/domain/repositories/forgot_pass_repo.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';

///
/// Created by Sisira Sahoo
/// On 17/08/22 6:05 PM
///

class ForgotPasswordUseCase extends UseCase<UserResponse, LoginRequestModel> {
  late final ForgotPasswordRepository forgotPasswordRepository;

  ForgotPasswordUseCase(this.forgotPasswordRepository);

  @override
  Future<UserResponse> call(LoginRequestModel params) =>
      forgotPasswordRepository.forgotPassword(params);
}
