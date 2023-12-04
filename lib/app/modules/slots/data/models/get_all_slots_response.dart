import 'dart:convert';


GetAllSlotsResponse getAllSlotsResponseFromJson(String str) =>
    GetAllSlotsResponse.fromJson(json.decode(str));

String getAllSlotsResponseToJson(GetAllSlotsResponse data) => json.encode(data.toJson());

class GetAllSlotsResponse {
  GetAllSlotsResponse();



  factory GetAllSlotsResponse.fromJson(Map<String, dynamic> json) => GetAllSlotsResponse(

  );

  Map<String, dynamic> toJson() => {

  };
}

