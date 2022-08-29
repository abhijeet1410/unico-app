import 'package:flutter_template_3/app/modules/forgot_password_otp/data/data_source/forgot_pass_otp_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_response_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/repositories/forgot_pass_otp_repo.dart';

///
/// Created by Sisira Sahoo
/// On 18/08/22 2:01 PM
///

class RemoteForgotPasswordOtpRepoImpl implements ForgotPassOtpRepository {
  final ForgotPasswordOtpDataSource _remoteSource;

  RemoteForgotPasswordOtpRepoImpl(this._remoteSource);

  @override
  Future<ForgotPassWordOtpResponseModel> forgotPasswordOtp(
      ForgotPassWordOtpRequestModel forgotOtpData) async {
    final response = await _remoteSource.forgotPasswordOtp(forgotOtpData);
    return ForgotPassWordOtpResponseModel.fromJson(response.body);
  }
}
