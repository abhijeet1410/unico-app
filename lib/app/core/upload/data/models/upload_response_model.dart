///
/// Created by Sunil Kumar
/// On 05-09-2022 11:31 AM
///
import 'dart:convert';

List<UploadResponse> uploadResponseFromJson(String str) =>
    List<UploadResponse>.from(
        json.decode(str).map((x) => UploadResponse.fromJson(x)));

String uploadResponseToJson(List<UploadResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UploadResponse {
  UploadResponse({
    required this.user,
    required this.purpose,
    required this.filePath,
    required this.fileType,
    required this.status,
    required this.id,
  });

  String user;
  String purpose;
  String filePath;
  int fileType;
  int status;
  String id;

  factory UploadResponse.fromJson(Map<String, dynamic> json) => UploadResponse(
        user: json["user"] ?? "",
        purpose: json["purpose"] ?? "",
        filePath: json["filePath"] ?? "",
        fileType: json["fileType"] ?? "",
        status: json["status"] ?? "",
        id: json["_id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "purpose": purpose,
        "filePath": filePath,
        "fileType": fileType,
        "status": status,
        "_id": id,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadResponse &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
