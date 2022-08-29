import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/register/data/data_source/register_data_source.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_password_request_model.dart';
import 'package:flutter_template_3/app/modules/register/domain/repositories/register_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
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
