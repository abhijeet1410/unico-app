import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:12 PM
///
class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<Response> loginWithApple(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginApple,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response> loginWithEmailPassword(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginEmailPassword,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response> loginWithFacebook(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginFacebook,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response> loginWithGoogle(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginGoogle,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response> loginWithPhonePassword(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginEmailPassword,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response> sendEmailOTP(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginEmailOTP,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response> sendPhoneOTP(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginPhoneOTP,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }
}
