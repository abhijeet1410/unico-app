import 'package:unico_app/app/network/exceptions/base_api_exception.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ApiException extends BaseApiException {
  ApiException({
    required int httpCode,
    required String status,
    String message = "",
    this.name,
    this.result,
    this.className,
  }) : super(httpCode: httpCode, status: status, message: message);

  String? name;
  String? className;
  bool? result;

  factory ApiException.fromJson(Map<String, dynamic> json) => ApiException(
        name: json["name"] ?? '',
        message: json["message"] ?? '',
        httpCode: json["code"] ?? 0,
        className: json["className"] ?? '',
        result: json['result'] ?? false,
        status: json['name'] ?? "",
      );

  @override
  String toString() => message;

  Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "code": httpCode,
        "className": className,
        "result": result,
        "status": name
      };
}
