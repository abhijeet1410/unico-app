import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_template_3/app/network/exceptions/json_format_exception.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:flutter_template_3/flavors/env_config.dart';
import 'package:get/get.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 04:49 PM
///

class BaseProvider extends GetConnect implements GetxService {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  bool? isMock;
  bool? authRequired;

  static const _jsonDir = 'assets/mocks/';
  static const _jsonExtension = '.json';
  @override
  bool get allowAutoSignedCert => _envConfig.allowAutoSignedCert;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = _envConfig.baseUrl;
    if (authRequired == true) httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    // httpClient.addResponseModifier(responseInterceptor);
  }

  @override
  Future<Response<T>> request<T>(String url, String method,
      {dynamic body,
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    if (_envConfig.useMockData || isMock == true) {
      try {
        final mockData = await loadMockData<T>(url.split("/").last);
        return Future.value(Response(
            headers: headers,
            statusCode: 200,
            statusText: "SUCCESS",
            body: mockData));
      } catch (e, s) {
        log("ERROR $e ${e.runtimeType}", stackTrace: s);
        if (e is TypeError) {
          throw JsonFormatException("Unable to parse data.");
        }
        rethrow;
      }
    } else {
      try {
        final res = await super.request<T>(url, method,
            headers: headers,
            contentType: contentType,
            query: query,
            decoder: decoder);

        return handleErrorStatus(res);
      } catch (e, s) {
        log("ERROR $e ${e.runtimeType}", stackTrace: s);
        if (e is TypeError) {
          throw JsonFormatException("Unable to parse data.");
        }
        rethrow;
      }
    }
  }

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) async {
    return request<T>(url, "get",
        headers: headers,
        decoder: decoder,
        query: query,
        contentType: contentType);
  }

  @override
  Future<Response<T>> post<T>(String? url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    if (url == null) throw ArgumentError("URL is required");

    return request<T>(
      url,
      "post",
      body: body,
      uploadProgress: uploadProgress,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
  }

  @override
  Future<Response<T>> put<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    return request<T>(
      url,
      "put",
      body: body,
      uploadProgress: uploadProgress,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
  }

  @override
  Future<Response<T>> patch<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    return request<T>(
      url,
      "patch",
      body: body,
      uploadProgress: uploadProgress,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) async {
    return request<T>(
      url,
      "delete",
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
  }

  Future<T> loadMockData<T>(String name) async {
    final resourcePath = _jsonDir + name + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    final mapData = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );

    return Future<T>.value(httpClient.defaultDecoder == null
        ? mapData
        : httpClient.defaultDecoder!(mapData));
  }
}
