///
/// Created by Sunil Kumar
/// On 16-08-2022 11:35 AM
///
// To parse this JSON data, do
//
//     final registerPhoneOtpRequestModel = registerPhoneOtpRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterPhoneOtpRequestModel registerPhoneOtpRequestModelFromJson(String str) =>
    RegisterPhoneOtpRequestModel.fromJson(json.decode(str));

String registerPhoneOtpRequestModelToJson(RegisterPhoneOtpRequestModel data) =>
    json.encode(data.toJson());

class RegisterPhoneOtpRequestModel {
  RegisterPhoneOtpRequestModel({
    required this.phone,
    required this.purpose,
  });

  String phone;
  int purpose;

  factory RegisterPhoneOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterPhoneOtpRequestModel(
        phone: json["phone"] ?? "",
        purpose: json["purpose"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "purpose": purpose,
      };
}
