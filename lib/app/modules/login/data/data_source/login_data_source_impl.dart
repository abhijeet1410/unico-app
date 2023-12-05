import 'package:unico_app/app/modules/login/data/data_source/login_data_source.dart';
import 'package:unico_app/app/modules/login/data/models/login_request_model.dart';
 import 'package:unico_app/app/route/api_routes.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<Response<dynamic>> loginWithApple(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginApple,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response<dynamic>> loginWithEmailPassword(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginEmailPassword,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response<dynamic>> loginWithFacebook(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginFacebook,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response<dynamic>> loginWithGoogle(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginGoogle,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response<dynamic>> loginWithPhonePassword(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginEmailPassword,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response<dynamic>> sendEmailOTP(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginEmailOTP,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }

  @override
  Future<Response<dynamic>> sendPhoneOTP(LoginRequestModel loginData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.loginPhoneOTP,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }
}
