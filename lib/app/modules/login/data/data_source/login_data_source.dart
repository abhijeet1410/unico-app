import 'package:flutter_template_3/app/core/models/user.dart';
import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api_provider.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:11 PM
///
abstract class LoginDataSource extends BaseProvider {
  Future<UserResponse> loginWithEmailPassword();

  Future<UserResponse> loginWithGoogle();

  Future<UserResponse> loginWithFacebook();

  Future<UserResponse> loginWithApple();

  Future<UserResponse> loginWithPhonePassword();

  Future<UserResponse> sendPhoneOTP();

  Future<UserResponse> sendEmailOTP();
}
