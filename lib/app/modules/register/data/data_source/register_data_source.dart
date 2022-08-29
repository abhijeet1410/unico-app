import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_password_request_model.dart';
import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:11 PM
///
abstract class RegisterDataSource extends BaseProvider {
  Future<Response> registerWithPhonePassword(
      RegisterPhonePasswordRequestModel loginData,
      {String? mockPath});
  Future<Response> sendRegisterPhoneOTP(RegisterPhoneOtpRequestModel loginData,
      {String? mockPath});
}
