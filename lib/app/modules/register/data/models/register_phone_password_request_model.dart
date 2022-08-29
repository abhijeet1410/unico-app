///
/// Created by Sunil Kumar
/// On 16-08-2022 11:37 AM
///
// To parse this JSON data, do
//
//     final registerPhonePasswordRequestModel = registerPhonePasswordRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterPhonePasswordRequestModel registerPhonePasswordRequestModelFromJson(
        String str) =>
    RegisterPhonePasswordRequestModel.fromJson(json.decode(str));

String registerPhonePasswordRequestModelToJson(
        RegisterPhonePasswordRequestModel data) =>
    json.encode(data.toJson());

class RegisterPhonePasswordRequestModel {
  RegisterPhonePasswordRequestModel({
    required this.registrationToken,
    required this.name,
    required this.phone,
    required this.purpose,
    required this.password,
    required this.role,
    required this.otp,
  });

  String registrationToken;
  String name;
  String phone;
  int purpose;
  String password;
  String otp;
  int role;

  factory RegisterPhonePasswordRequestModel.fromJson(
          Map<String, dynamic> json) =>
      RegisterPhonePasswordRequestModel(
        registrationToken: json["registrationToken"],
        name: json["name"],
        phone: json["phone"],
        purpose: json["purpose"],
        password: json["password"],
        role: json["role"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "registrationToken": registrationToken,
        "name": name,
        "phone": phone,
        "purpose": purpose,
        "password": password,
        "role": role,
        "otp": otp,
      };
}
