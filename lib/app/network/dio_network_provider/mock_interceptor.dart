import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/mocks/';
  static const _jsonExtension = '.json';

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resourcePath = _jsonDir + options.path + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    final map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );

    return Response(data: map, statusCode: 200, requestOptions: options);
  }
}
