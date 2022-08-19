import 'package:flutter_template_3/app/modules/login/data/models/login_otp_response.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _remoteSource;

  LoginRepositoryImpl(this._remoteSource);

  @override
  Future<UserResponse> loginWithApple(LoginRequestModel loginData) async {
    final response = await _remoteSource.loginWithApple(loginData);
    return UserResponse.fromJson(response.body);
  }

  @override
  Future<UserResponse> loginWithEmailPassword(
      LoginRequestModel loginData) async {
    final response = await _remoteSource.loginWithEmailPassword(loginData);
    return UserResponse.fromJson(response.body);
  }

  @override
  Future<UserResponse> loginWithFacebook(LoginRequestModel loginData) async {
    final response = await _remoteSource.loginWithFacebook(loginData);
    return UserResponse.fromJson(response.body);
  }

  @override
  Future<UserResponse> loginWithGoogle(LoginRequestModel loginData) async {
    final response = await _remoteSource.loginWithGoogle(loginData);
    return UserResponse.fromJson(response.body);
  }

  @override
  Future<UserResponse> loginWithPhonePassword(
      LoginRequestModel loginData) async {
    final response = await _remoteSource.loginWithPhonePassword(loginData);
    return UserResponse.fromJson(response.body);
  }

  @override
  Future<LoginOTPResponse> sendEmailOTP(LoginRequestModel loginData) async {
    final response = await _remoteSource.sendEmailOTP(loginData);
    return LoginOTPResponse.fromJson(response.body);
  }

  @override
  Future<LoginOTPResponse> sendPhoneOTP(LoginRequestModel loginData) async {
    final response = await _remoteSource.sendPhoneOTP(loginData);
    return LoginOTPResponse.fromJson(response.body);
  }
}
