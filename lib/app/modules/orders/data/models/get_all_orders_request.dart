import 'dart:convert';

GetAllOrdersRequest getAllOrdersRequestFromJson(String str) =>
    GetAllOrdersRequest.fromJson(json.decode(str));

String getAllOrdersRequestToJson(GetAllOrdersRequest data) =>
    json.encode(data.toJson());

class GetAllOrdersRequest {
  GetAllOrdersRequest();

  factory GetAllOrdersRequest.fromJson(Map<String, dynamic> json) => GetAllOrdersRequest();

  Map<String, dynamic> toJson() => {};
}
