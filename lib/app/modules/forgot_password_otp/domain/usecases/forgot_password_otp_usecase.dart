import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_response_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/repositories/forgot_pass_otp_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ForgotPasswordOtpUseCase extends UseCase<ForgotPassWordOtpResponseModel,
    ForgotPassWordOtpRequestModel> {
  late final ForgotPassOtpRepository forgotPassOtpRepository;

  ForgotPasswordOtpUseCase(this.forgotPassOtpRepository);

  @override
  Future<ForgotPassWordOtpResponseModel> call(
          ForgotPassWordOtpRequestModel params) =>
      forgotPassOtpRepository.forgotPasswordOtp(params);
}
