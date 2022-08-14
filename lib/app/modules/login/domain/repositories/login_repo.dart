import 'package:flutter_template_3/app/modules/login/data/models/login_otp_response.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 06:51 PM
///
abstract class LoginRepository {
  Future<UserResponse> loginWithEmailPassword(LoginRequestModel loginData);

  Future<UserResponse> loginWithGoogle(LoginRequestModel loginData);

  Future<UserResponse> loginWithFacebook(LoginRequestModel loginData);

  Future<UserResponse> loginWithApple(LoginRequestModel loginData);

  Future<UserResponse> loginWithPhonePassword(LoginRequestModel loginData);

  Future<LoginOTPResponse> sendPhoneOTP(LoginRequestModel loginData);

  Future<LoginOTPResponse> sendEmailOTP(LoginRequestModel loginData);
}
