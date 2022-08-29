import 'dart:convert';

///
/// Created by Sunil Kumar from Boiler plate
///

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
