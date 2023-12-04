import 'dart:convert';

GetAllSlotsRequest getAllSlotsRequestFromJson(String str) =>
    GetAllSlotsRequest.fromJson(json.decode(str));

String getAllSlotsRequestToJson(GetAllSlotsRequest data) =>
    json.encode(data.toJson());

class GetAllSlotsRequest {
  GetAllSlotsRequest();

  factory GetAllSlotsRequest.fromJson(Map<String, dynamic> json) => GetAllSlotsRequest();

  Map<String, dynamic> toJson() => {};
}
