import 'package:unico_app/app/network/exceptions/app_exception.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class BaseApiException extends AppException {
  final int httpCode;
  final String status;

  BaseApiException({this.httpCode = -1, this.status = "", String message = ""})
      : super(message: message);
}
