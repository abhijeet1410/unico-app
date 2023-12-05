import 'package:unico_app/app/modules/login/data/models/login_request_model.dart';
import 'package:unico_app/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class LoginDataSource extends BaseProvider {
  Future<Response> loginWithEmailPassword(LoginRequestModel loginData,
      {String? mockPath});

  Future<Response> loginWithGoogle(LoginRequestModel loginData,
      {String? mockPath});

  Future<Response> loginWithFacebook(LoginRequestModel loginData,
      {String? mockPath});

  Future<Response> loginWithApple(LoginRequestModel loginData,
      {String? mockPath});

  Future<Response> loginWithPhonePassword(LoginRequestModel loginData,
      {String? mockPath});

  Future<Response> sendPhoneOTP(LoginRequestModel loginData,
      {String? mockPath});

  Future<Response> sendEmailOTP(LoginRequestModel loginData,
      {String? mockPath});
}
