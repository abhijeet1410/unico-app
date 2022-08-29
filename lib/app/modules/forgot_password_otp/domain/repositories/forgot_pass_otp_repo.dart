import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_response_model.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class ForgotPassOtpRepository {
  Future<ForgotPassWordOtpResponseModel> forgotPasswordOtp(
      ForgotPassWordOtpRequestModel loginData);
}
