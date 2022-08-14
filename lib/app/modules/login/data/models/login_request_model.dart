///
/// Created by Sunil Kumar
/// On 13-08-2022 09:27 AM
///

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  LoginRequestModel({
    this.deviceId,
    this.platform,
    this.fcmId,
    required this.action,
    this.countryCode,
    this.email,
    this.password,
    this.phone,
    required this.locale,
    required this.timeZoneOffset,
  });

  String? deviceId;
  String? platform;
  String? fcmId;
  String action;
  String? countryCode;
  String? email;
  String? password;
  String? phone;
  String locale;
  String timeZoneOffset;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        deviceId: json["deviceId"],
        platform: json["platform"],
        fcmId: json["fcmId"],
        action: json["action"],
        countryCode: json["countryCode"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        locale: json["locale"] ?? "en",
        timeZoneOffset: json["timeZone"] ?? "+5.30",
      );

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "platform": platform,
        "fcmId": fcmId,
        "action": action,
        "countryCode": countryCode,
        "email": email,
        "password": password,
        "phone": phone,
        "locale": locale,
        "timeZone": timeZoneOffset,
      };
}
