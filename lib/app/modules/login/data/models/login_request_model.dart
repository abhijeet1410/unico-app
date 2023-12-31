import 'dart:convert';

///
/// Created by Sunil Kumar from Boiler plate
///

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  LoginRequestModel({
    this.deviceId,
    this.deviceType,
    this.strategy,
    this.fcmId,
    this.action,
    this.countryCode,
    this.email,
    this.password,
    this.phone,
    required this.locale,
    required this.timeZoneOffset,
    this.purpose,
  });

  String? deviceId;
  String? deviceType;
  String? strategy;
  String? fcmId;
  String? action;
  String? countryCode;
  String? email;
  String? password;
  String? phone;
  int? purpose;
  String locale;
  String timeZoneOffset;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        deviceId: json["deviceId"],
        deviceType: json["deviceType"],
        strategy: json["strategy"],
        fcmId: json["fcmId"],
        action: json["action"],
        countryCode: json["countryCode"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        purpose: json["purpose"] ?? 0,
        locale: json["locale"] ?? "en",
        timeZoneOffset: json["timeZone"] ?? "+5.30",
      );

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId ?? "12345",
        "deviceType": deviceType ?? "1",
        if (strategy != null) "strategy": strategy,
        "fcmId": fcmId,
        if (action != null) "action": action,
        "countryCode": countryCode,
        "email": email,
        "password": password,
        "phone": phone,
        "locale": locale,
        "purpose": purpose,
        "timeZone": timeZoneOffset,
      };
}
