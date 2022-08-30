import 'package:flutter_template_3/app/modules/forgot_password/data/data_source/forgot_password_source.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ForgotPasswordSourceImpl extends ForgotPasswordDataSource {
  @override
  Future<Response> forgotPassword(LoginRequestModel forgotData,
      {String? mockPath}) {
    return post(
      AppApiRoutes.credentialVerification,
      forgotData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }
}