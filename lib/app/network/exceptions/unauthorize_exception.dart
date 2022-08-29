import 'dart:io';

import 'package:flutter_template_3/app/network/exceptions/base_api_exception.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class UnauthorizedException extends BaseApiException {
  UnauthorizedException(String message)
      : super(
            httpCode: HttpStatus.unauthorized,
            message: message,
            status: "unauthorized");
}
