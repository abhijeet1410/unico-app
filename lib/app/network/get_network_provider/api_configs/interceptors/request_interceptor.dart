///
/// Created by Sunil Kumar
/// On 12-07-2022 04:51 PM
///
import 'dart:async';

import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(Request request) async {
  return request;
}
