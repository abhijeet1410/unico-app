import 'dart:convert';

///
/// Created by Sunil Kumar from Boiler plate
///

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
