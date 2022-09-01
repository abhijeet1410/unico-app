import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import 'package:flutter_template_3/app/core/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/network/dio_network_provider/dio_provider.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class DioRequestRetrier {
  final dioClient = DioProvider.tokenClient;
  final RequestOptions requestOptions;

  final PreferenceManager _preferenceManager =
      getx.Get.find<PreferenceManager>();

  DioRequestRetrier({required this.requestOptions});

  Future<Response<T>> retry<T>() async {
    var header = await getCustomHeaders();

    return await dioClient.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(headers: header, method: requestOptions.method),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String? accessToken = _preferenceManager.accessToken;
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken != null && accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
