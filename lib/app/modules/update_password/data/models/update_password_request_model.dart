///
/// Created by Sisira Sahoo
/// On 18/08/22 4:45 PM
///

import 'dart:convert';

UpdatePasswordRequest updatePasswordRequestFromJson(String str) =>
    UpdatePasswordRequest.fromJson(json.decode(str));

String updatePasswordRequestToJson(UpdatePasswordRequest data) =>
    json.encode(data.toJson());

class UpdatePasswordRequest {
  UpdatePasswordRequest({
    required this.token,
    required this.password,
    required this.id,
  });

  String token;
  String password;
  String id;

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordRequest(
        token: json["token"] ?? '',
        password: json["password"] ?? '',
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "password": password,
        "id": id,
      };
}
