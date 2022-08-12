import 'package:flutter_template_3/app/core/models/user.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/repository/login_repo.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class MockLoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _remoteSource = Get.find<LoginDataSource>();

  @override
  Future<UserResponse> loginWithApple() {
    return _remoteSource.loginWithApple();
  }

  @override
  Future<UserResponse> loginWithEmailPassword() {
    return _remoteSource.loginWithEmailPassword();
  }

  @override
  Future<UserResponse> loginWithFacebook() {
    return _remoteSource.loginWithFacebook();
  }

  @override
  Future<UserResponse> loginWithGoogle() {
    return _remoteSource.loginWithGoogle();
  }

  @override
  Future<UserResponse> loginWithPhonePassword() {
    return _remoteSource.loginWithPhonePassword();
  }

  @override
  Future<UserResponse> sendEmailOTP() {
    return _remoteSource.sendEmailOTP();
  }

  @override
  Future<UserResponse> sendPhoneOTP() {
    return _remoteSource.sendPhoneOTP();
  }
}
