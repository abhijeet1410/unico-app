import 'package:dio/dio.dart';
import 'package:unico_app/app/core/local/preference/preference_manager.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((Map<String, String> customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final Map<String, String> customHeaders = {
      'content-type': 'application/json'
    };
    final PreferenceManager preferenceManager = Get.find<PreferenceManager>();
    final String? accessToken = preferenceManager.accessToken;
    if (accessToken != null && accessToken.trim().isNotEmpty) {
      customHeaders['Authorization'] = "Bearer $accessToken";
    }
    return customHeaders;
  }
}
