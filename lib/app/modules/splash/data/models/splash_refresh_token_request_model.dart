///
/// Created by Sunil Kumar
/// On 16-08-2022 11:35 AM
///
// To parse this JSON data, do
//
//     final registerPhoneOtpRequestModel = registerPhoneOtpRequestModelFromJson(jsonString);

import 'dart:convert';

class RefreshTokenRequestModel {
  RefreshTokenRequestModel({
    this.deviceId,
    this.deviceType,
  });

  String? deviceId;
  String? deviceType;

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenRequestModel(
        deviceId: json["deviceId"] ?? "",
        deviceType: json["deviceType"] ?? "1",
      );

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "deviceType": deviceType,
      };
}
