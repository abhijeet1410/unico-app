import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:unico_app/app/network/exceptions/api_exception.dart';
import 'package:unico_app/app/network/exceptions/app_exception.dart';
import 'package:unico_app/app/network/exceptions/network_exception.dart';
import 'package:unico_app/app/network/exceptions/not_found_exception.dart';
import 'package:unico_app/app/network/exceptions/service_unavailable_exception.dart';
import 'package:unico_app/flavors/build_config.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

Exception handleError(String error) {
  final logger = BuildConfig.instance.config.logger;
  logger.e("Generic exception: $error");

  return AppException(message: error);
}

Exception handleDioError(DioException dioError) {
  //
  // switch (dioError.type) {
  //   case DioException.cancel:
  //     return AppException(message: "Request to API server was cancelled");
  //   case DioException.connectTimeout:
  //     return AppException(message: "Connection timeout with API server");
  //   case DioException.other:
  //     return NetworkException();
  //   case DioException.receiveTimeout:
  //     return TimeoutException("Receive timeout in connection with API server");
  //   case DioException.sendTimeout:
  //     return TimeoutException("Send timeout in connection with API server");
  //   case DioException.response:
  return _parseDioErrorResponse(dioError);
  // }
}

Exception _parseDioErrorResponse(DioError dioError) {
  final logger = BuildConfig.instance.config.logger;

  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");
    default:
      return ApiException(
          httpCode: statusCode,
          status: status ?? "",
          message: serverMessage ?? "");
  }
}
