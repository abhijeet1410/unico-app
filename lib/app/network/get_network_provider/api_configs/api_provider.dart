import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_template_3/app/network/exceptions/json_format_exception.dart';
import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:flutter_template_3/flavors/env_config.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class BaseProvider extends GetConnect implements GetxService {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  bool? authRequired;

  static const _jsonDir = 'assets/mocks/';
  static const _jsonExtension = '.json';

  @override
  bool get allowAutoSignedCert => _envConfig.allowAutoSignedCert;

  @override
  void onInit() {
    super.onInit();
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.timeout = const Duration(seconds: 10);
    // httpClient.addResponseModifier(responseInterceptor);
  }

  @override
  Future<Response<T>> request<T>(String url, String method,
      {dynamic body,
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress,
      String? mockPath,
      bool authRequired = true,
      String? baseUrl}) async {
    httpClient.baseUrl = baseUrl ?? _envConfig.baseUrl;
    final logger = BuildConfig.instance.config.logger;
    logger.i("NETWORK_CALL: $url $method $body $headers");

    if (_envConfig.useMockData && mockPath == null) {
      throw ArgumentError("Please provide mock path in Mock Environment");
    }
    if (authRequired == true) httpClient.addAuthenticator(authInterceptor);

    if (_envConfig.useMockData || mockPath != null) {
      try {
        final mockData = await loadMockData<T>(mockPath!);
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
            body: body,
            uploadProgress: uploadProgress,
            decoder: decoder);

        return handleErrorStatus(res);
      } catch (e, s) {
        logger.e("NETWORK_ERROR", e, s);
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
      Decoder<T>? decoder,
      String? mockPath,
      bool authRequired = true,
      String? baseUrl}) async {
    return request<T>(url, "get",
        headers: headers,
        decoder: decoder,
        query: query,
        contentType: contentType,
        mockPath: mockPath,
        authRequired: authRequired,
        baseUrl: baseUrl);
  }

  @override
  Future<Response<T>> post<T>(String? url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress,
      String? mockPath,
      bool authRequired = true,
      String? baseUrl}) async {
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
      baseUrl: baseUrl,
      authRequired: authRequired,
      mockPath: mockPath,
    );
  }

  @override
  Future<Response<T>> put<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress,
      String? mockPath,
      bool authRequired = true,
      String? baseUrl}) async {
    return request<T>(
      url,
      "put",
      body: body,
      uploadProgress: uploadProgress,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
      mockPath: mockPath,
      authRequired: authRequired,
      baseUrl: baseUrl,
    );
  }

  @override
  Future<Response<T>> patch<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress,
      String? mockPath,
      bool authRequired = true,
      String? baseUrl}) async {
    return request<T>(
      url,
      "patch",
      body: body,
      uploadProgress: uploadProgress,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
      mockPath: mockPath,
      baseUrl: baseUrl,
      authRequired: authRequired,
    );
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      String? mockPath,
      bool authRequired = true,
      String? baseUrl}) async {
    return request<T>(
      url,
      "delete",
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
      mockPath: mockPath,
      authRequired: authRequired,
      baseUrl: baseUrl,
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
