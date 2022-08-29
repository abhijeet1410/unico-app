import 'package:dio/dio.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var customHeaders = {'content-type': 'application/json'};

    return customHeaders;
  }
}
