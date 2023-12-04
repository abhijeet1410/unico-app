import 'dart:convert';


GetAllOrdersResponse getAllOrdersResponseFromJson(String str) =>
    GetAllOrdersResponse.fromJson(json.decode(str));

String getAllOrdersResponseToJson(GetAllOrdersResponse data) => json.encode(data.toJson());

class GetAllOrdersResponse {
  GetAllOrdersResponse();



  factory GetAllOrdersResponse.fromJson(Map<String, dynamic> json) => GetAllOrdersResponse(

  );

  Map<String, dynamic> toJson() => {

  };
}

