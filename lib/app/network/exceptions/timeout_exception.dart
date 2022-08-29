import 'package:flutter_template_3/app/network/exceptions/base_exception.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class TimeoutException extends BaseException {
  TimeoutException(String message) : super(message: message);
}
