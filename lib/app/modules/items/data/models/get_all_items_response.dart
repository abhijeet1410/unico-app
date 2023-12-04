import 'dart:convert';


GetAllItemsResponse getAllItemsResponseFromJson(String str) =>
    GetAllItemsResponse.fromJson(json.decode(str));

String getAllItemsResponseToJson(GetAllItemsResponse data) => json.encode(data.toJson());

class GetAllItemsResponse {
  GetAllItemsResponse();



  factory GetAllItemsResponse.fromJson(Map<String, dynamic> json) => GetAllItemsResponse(

  );

  Map<String, dynamic> toJson() => {

  };
}

