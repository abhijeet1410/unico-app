import 'package:flutter_template_3/app/network/exceptions/base_exception.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class NetworkException extends BaseException {
  NetworkException({String message = "No internet connection"})
      : super(message: message);
}
