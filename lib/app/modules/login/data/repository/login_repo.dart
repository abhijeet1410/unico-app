import 'package:flutter_template_3/app/core/models/user.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 06:51 PM
///
abstract class LoginRepository {
  Future<UserResponse> loginWithEmailPassword();

  Future<UserResponse> loginWithGoogle();

  Future<UserResponse> loginWithFacebook();

  Future<UserResponse> loginWithApple();

  Future<UserResponse> loginWithPhonePassword();

  Future<UserResponse> sendPhoneOTP();

  Future<UserResponse> sendEmailOTP();
}
