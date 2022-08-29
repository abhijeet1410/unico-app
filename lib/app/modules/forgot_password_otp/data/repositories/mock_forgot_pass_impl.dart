import 'package:flutter_template_3/app/modules/forgot_password_otp/data/data_source/forgot_pass_otp_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_response_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/repositories/forgot_pass_otp_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class MockForgotPasswordOtpRepoImpl implements ForgotPassOtpRepository {
  final ForgotPasswordOtpDataSource _remoteSource;

  MockForgotPasswordOtpRepoImpl(this._remoteSource);

  @override
  Future<ForgotPassWordOtpResponseModel> forgotPasswordOtp(
      ForgotPassWordOtpRequestModel forgotOtpData) async {
    final response = await _remoteSource.forgotPasswordOtp(forgotOtpData,
        mockPath: 'forgot pass otp');
    return ForgotPassWordOtpResponseModel.fromJson(response.body);
  }
}
