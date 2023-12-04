import 'dart:convert';

GetAllItemsRequest getAllItemsRequestFromJson(String str) =>
    GetAllItemsRequest.fromJson(json.decode(str));

String getAllItemsRequestToJson(GetAllItemsRequest data) =>
    json.encode(data.toJson());

class GetAllItemsRequest {
  GetAllItemsRequest();

  factory GetAllItemsRequest.fromJson(Map<String, dynamic> json) => GetAllItemsRequest();

  Map<String, dynamic> toJson() => {};
}
