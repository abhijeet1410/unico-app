import 'package:flutter_template_3/app/modules/login/data/models/login_otp_response.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:flutter_template_3/app/modules/register/data/data_source/register_data_source.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_password_request_model.dart';
import 'package:flutter_template_3/app/modules/register/domain/repositories/register_repo.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class RemoteRegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource _remoteSource;
  RemoteRegisterRepositoryImpl(this._remoteSource);

  @override
  Future<UserResponse> registerUsingPhonePassword(
      RegisterPhonePasswordRequestModel requestModel) async {
    final response = await _remoteSource.registerWithPhonePassword(
      requestModel,
    );
    return UserResponse.fromJson(response.body);
  }

  @override
  Future<String> sendPhoneOTP(RegisterPhoneOtpRequestModel requestModel) async {
    final response = await _remoteSource.sendRegisterPhoneOTP(
      requestModel,
    );
    // print(response.body);
    // return response.body["accessToken"];
    return "OTP sent successfully";
  }
}
