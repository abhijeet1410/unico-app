///
/// Created by Sunil Kumar from Boiler plate
///

import 'dart:async';
import 'package:unico_app/app/core/local/preference/preference_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> authInterceptor(Request request) async {
  final PreferenceManager preferenceManager = Get.find<PreferenceManager>();
  final String? accessToken = preferenceManager.accessToken;
  if (accessToken != null && accessToken.trim().isNotEmpty) {
    request.headers['Authorization'] = accessToken;
  }
  return request;
}
