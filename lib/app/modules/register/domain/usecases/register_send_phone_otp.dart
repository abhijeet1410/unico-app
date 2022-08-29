import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/register/domain/repositories/register_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RegisterSendPhoneOTPUseCase
    extends UseCase<String, RegisterPhoneOtpRequestModel> {
  late final RegisterRepository repository;

  RegisterSendPhoneOTPUseCase(this.repository);

  @override
  Future<String> call(RegisterPhoneOtpRequestModel params) =>
      repository.sendPhoneOTP(params);
}
