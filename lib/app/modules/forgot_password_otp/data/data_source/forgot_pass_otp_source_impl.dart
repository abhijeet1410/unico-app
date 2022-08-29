import 'package:flutter_template_3/app/modules/forgot_password_otp/data/data_source/forgot_pass_otp_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_request_model.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpDataSourceImpl extends ForgotPasswordOtpDataSource {
  @override
  Future<Response> forgotPasswordOtp(ForgotPassWordOtpRequestModel otpData,
      {String? mockPath}) {
    return patch(
      AppApiRoutes.credentialVerification,
      otpData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }
}
