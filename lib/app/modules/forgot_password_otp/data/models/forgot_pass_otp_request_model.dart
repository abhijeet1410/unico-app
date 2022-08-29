import 'dart:convert';

///
/// Created by Sunil Kumar from Boiler plate
///

ForgotPassWordOtpRequestModel forgotPassWordOtpRequestModelFromJson(
        String str) =>
    ForgotPassWordOtpRequestModel.fromJson(json.decode(str));

String forgotPassWordOtpRequestModelToJson(
        ForgotPassWordOtpRequestModel data) =>
    json.encode(data.toJson());

class ForgotPassWordOtpRequestModel {
  ForgotPassWordOtpRequestModel({
    required this.phone,
    required this.otp,
    required this.purpose,
  });

  String phone;
  String otp;
  int purpose;

  factory ForgotPassWordOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      ForgotPassWordOtpRequestModel(
        phone: json["phone"] ?? '',
        otp: json["otp"] ?? '',
        purpose: json["purpose"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "otp": otp,
        "purpose": purpose,
      };
}
