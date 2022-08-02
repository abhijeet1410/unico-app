///
/// Created by Sunil Kumar
/// On 12-07-2022 04:51 PM
///
import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

dynamic handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      var responseJson = response.body.toString();
      return responseJson;
    case 500:
      throw "Server Error pls retry later";
    case 403:
      throw 'Error occurred pls check internet and retry.';
    default:
      throw 'Error occurred retry';
  }
}
