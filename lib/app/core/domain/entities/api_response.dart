class ApiResponse {
  bool? status;
  String? message;
  dynamic data;
  int? statusCode;

  ApiResponse({this.status, this.message, this.data, this.statusCode});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    statusCode = json['statusCode'];
  }
}
