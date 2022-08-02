import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_template_3/configs/environment.dart';
import 'package:get/get.dart';
import 'api.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 04:49 PM
///

class BaseProvider extends GetConnect implements GetxService {
  bool? isMock;
  static const _jsonDir = 'assets/mocks/';
  static const _jsonExtension = '.json';
  @override
  bool get allowAutoSignedCert => true;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Environment.baseApiUrl;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

  @override
  Future<Response<T>> request<T>(String url, String method,
      {dynamic body,
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    return super.request(url, method);
  }

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) async {
    if (Environment.useMockData || isMock == true) {
      return Future.value(Response(
        headers: headers,
        statusCode: 200,
        statusText: "SUCCESS",
        body: await loadMockData<T>(url.split("/").last),
      ));
    } else {
      return super.get<T>(url,
          headers: headers,
          contentType: contentType,
          query: query,
          decoder: decoder);
    }
  }

  @override
  Future<Response<T>> post<T>(String? url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    if (url == null) throw ArgumentError("URL is required");
    if (Environment.useMockData || isMock == true) {
      final mockData = await loadMockData<T>(url.split("/").last);
      return Future.value(Response(
        headers: headers,
        statusCode: 201,
        statusText: "SUCCESS",
        body: mockData is List ? mockData.first : mockData,
      ));
    } else {
      return super.post<T>(
        url,
        body,
        uploadProgress: uploadProgress,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder,
      );
    }
  }

  @override
  Future<Response<T>> put<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    if (Environment.useMockData || isMock == true) {
      final mockData = await loadMockData<T>(url.split("/").last);
      return Future.value(Response(
        headers: headers,
        statusCode: 200,
        statusText: "SUCCESS",
        body: mockData is List ? mockData.first : mockData,
      ));
    } else {
      return super.put<T>(
        url,
        body,
        uploadProgress: uploadProgress,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder,
      );
    }
  }

  @override
  Future<Response<T>> patch<T>(String url, dynamic body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    if (Environment.useMockData || isMock == true) {
      final mockData = await loadMockData<T>(url.split("/").last);
      return Future.value(Response(
        headers: headers,
        statusCode: 200,
        statusText: "SUCCESS",
        body: mockData is List ? mockData.first : mockData,
      ));
    } else {
      return super.patch<T>(
        url,
        body,
        uploadProgress: uploadProgress,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder,
      );
    }
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) async {
    if (Environment.useMockData || isMock == true) {
      final mockData = await loadMockData<T>(url.split("/").last);
      return Future.value(Response(
        headers: headers,
        statusCode: 200,
        statusText: "SUCCESS",
        body: mockData is List ? mockData.first : mockData,
      ));
    } else {
      return super.delete<T>(
        url,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder,
      );
    }
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
