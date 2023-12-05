import 'dart:io';

import 'package:unico_app/app/network/exceptions/base_api_exception.dart';

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
