///
/// Created by Sunil Kumar
/// On 12-07-2022 04:51 PM
///
import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(Request request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  return request;
}
