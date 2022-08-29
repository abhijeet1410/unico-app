import 'dart:io';
import 'package:flutter_template_3/app/network/exceptions/api_exception.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class NotFoundException extends ApiException {
  NotFoundException(String message, String status)
      : super(httpCode: HttpStatus.notFound, status: status, message: message);
}
