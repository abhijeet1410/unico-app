import 'package:flutter_template_3/configs/environment.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'api.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 04:49 PM
///

class BaseProvider extends GetConnect implements GetxService {
  bool isMock = true;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Environment.baseApiUrl;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    return super.delete(url);
  }

  @override
  Future<Response<T>> request<T>(String url, String method,
      {dynamic body,
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super.request(url, method);
  }

  @override
  Future<Response<T>> patch<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super.patch(url, body);
  }

  @override
  Future<Response<T>> put<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super.put(url, body);
  }

  // @override
  // Future<Response<T>> post<T>(String url, dynamic body,
  //     {String? contentType,
  //     Map<String, String>? headers,
  //     Map<String, dynamic>? query,
  //     Decoder<T>? decoder,
  //     Progress? uploadProgress}) {
  //   return super.post(url, body);
  // }

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    return super.get(url);
  }
}
