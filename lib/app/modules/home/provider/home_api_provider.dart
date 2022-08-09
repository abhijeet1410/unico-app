import 'dart:developer';

import 'package:flutter_template_3/app/data/model/city.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:get/get.dart';

import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 05:03 PM
///
// class HomeApiProvider extends BaseRemoteSource {
//   Future<List<City>> getCountries() async {
//     var endpoint = "${DioProvider.baseUrl}/user";
//     var dioCall = dioClient.get(endpoint);
//
//     return callApiWithErrorParser(dioCall)
//         .then((response) => _parseCityListResponse(response));
//   }
//
//   List<City> _parseCityListResponse(Response<dynamic> response) {
//     return List<City>.from(response.data["data"].map((x) => City.fromJson(x)));
//   }
//
//   City _parseCityResponse(Response<dynamic> response) {
//     return City.fromJson(response.data);
//   }
// }
class HomeApiProvider extends BaseProvider {
  Future<List<City>> getCountries() async {
    try {
      final res = await get(AppApiRoutes.country, query: {"\$limit": "-1"});
      return _parseCityListResponse(res);
    } catch (e, s) {
      log("ERROR $e ${e.runtimeType}", stackTrace: s);
      return Future.error(e.toString());
    }
  }

  List<City> _parseCityListResponse(Response<dynamic> response) {
    return List<City>.from(response.body.map((x) => City.fromJson(x)));
  }

  City _parseCityResponse(Response<dynamic> response) {
    return City.fromJson(response.body);
  }
}
