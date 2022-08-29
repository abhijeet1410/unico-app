import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_password_request_model.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/modules/register/data/data_source/register_data_source.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RegisterDataSourceImpl extends RegisterDataSource {
  @override
  Future<Response> registerWithPhonePassword(
      RegisterPhonePasswordRequestModel loginData,
      {String? mockPath}) async {
    try {
      final res = await patch(
        AppApiRoutes.credentialVerification,
        {"phone": loginData.phone, "purpose": 1, "otp": loginData.otp},
        mockPath: mockPath,
        authRequired: false,
      );
      Get.find<PreferenceManager>()
          .storeAccessToken(res.body["registrationToken"]);
      return post(
        AppApiRoutes.user,
        loginData.toJson(),
        mockPath: mockPath,
        authRequired: false,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> sendRegisterPhoneOTP(RegisterPhoneOtpRequestModel loginData,
      {String? mockPath}) async {
    return post(
      AppApiRoutes.credentialVerification,
      loginData.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }
}
