import 'package:flutter_template_3/app/modules/login/data/models/login_otp_response.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_password_request_model.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 06:51 PM
///
abstract class RegisterRepository {
  Future<String> sendPhoneOTP(RegisterPhoneOtpRequestModel requestModel);
  Future<UserResponse> registerUsingPhonePassword(
      RegisterPhonePasswordRequestModel requestModel);
}
