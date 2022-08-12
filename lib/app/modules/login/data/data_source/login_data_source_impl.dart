import 'package:flutter_template_3/app/core/models/user.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:12 PM
///
class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<UserResponse> loginWithApple() async {
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> loginWithEmailPassword() {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> loginWithPhonePassword() {
    // TODO: implement loginWithPhonePassword
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> sendEmailOTP() {
    // TODO: implement sendEmailOTP
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> sendPhoneOTP() {
    // TODO: implement sendPhoneOTP
    throw UnimplementedError();
  }
}
