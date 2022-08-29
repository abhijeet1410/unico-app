import 'dart:async';
import 'dart:io';
import 'package:flutter_template_3/app/network/exceptions/api_exception.dart';
import 'package:flutter_template_3/app/network/exceptions/network_exception.dart';
import 'package:flutter_template_3/app/network/exceptions/not_found_exception.dart';
import 'package:flutter_template_3/app/network/exceptions/service_unavailable_exception.dart';
import 'package:flutter_template_3/app/network/exceptions/unauthorize_exception.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  final logger = BuildConfig.instance.config.logger;
  logger.e(
      "Generic exception: ${request.url} ${response.statusCode} ${response.body}");

  if (response.statusCode != HttpStatus.ok) {
    return handleErrorStatus(response);
  }

  return response;
}

dynamic handleErrorStatus(Response response) {
  if (response.statusCode == null) {
    throw NetworkException();
  }
  switch (response.statusCode) {
    case HttpStatus.ok:
    case HttpStatus.created:
    case HttpStatus.accepted:
      return response;
    case HttpStatus.notFound:
      throw NotFoundException("Not found", "NotFound");
    case HttpStatus.unauthorized:
      throw UnauthorizedException("You are not authorized. Please sign in.");
    case HttpStatus.internalServerError:
      throw ApiException(
          status: "InternalServerError",
          httpCode: HttpStatus.internalServerError,
          message: "Internal server error");
    case HttpStatus.badGateway:
      throw ServiceUnavailableException(
          "Could not connect to server. Please try again later.");
    case HttpStatus.gatewayTimeout:
      throw TimeoutException("Timeout error");
    case HttpStatus.badRequest:
    case HttpStatus.forbidden:
    case HttpStatus.conflict:
      throw ApiException.fromJson(response.body);

    default:
      throw 'Error occurred retry';
  }
}
