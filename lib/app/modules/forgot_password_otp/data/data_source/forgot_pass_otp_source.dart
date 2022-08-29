import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_request_model.dart';
import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class ForgotPasswordOtpDataSource extends BaseProvider {
  Future<Response> forgotPasswordOtp(ForgotPassWordOtpRequestModel otpData,
      {String? mockPath});
}
