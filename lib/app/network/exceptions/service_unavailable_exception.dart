import 'dart:io';

import 'package:flutter_template_3/app/network/exceptions/base_api_exception.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ServiceUnavailableException extends BaseApiException {
  ServiceUnavailableException(String message)
      : super(
            httpCode: HttpStatus.serviceUnavailable,
            message: message,
            status: "");
}
