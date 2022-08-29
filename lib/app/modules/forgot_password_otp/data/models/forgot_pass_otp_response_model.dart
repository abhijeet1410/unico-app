import 'dart:convert';

///
/// Created by Sunil Kumar from Boiler plate
///

ForgotPassWordOtpResponseModel forgotPassWordOtpResponseModelFromJson(
        String str) =>
    ForgotPassWordOtpResponseModel.fromJson(json.decode(str));

String forgotPassWordOtpResponseModelToJson(
        ForgotPassWordOtpResponseModel data) =>
    json.encode(data.toJson());

class ForgotPassWordOtpResponseModel {
  ForgotPassWordOtpResponseModel({
    required this.token,
    required this.id,
  });

  String token;
  String id;

  factory ForgotPassWordOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgotPassWordOtpResponseModel(
        token: json["token"] ?? '',
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
      };
}
