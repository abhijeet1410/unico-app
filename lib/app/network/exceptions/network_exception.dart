import '/app/network/exceptions/base_exception.dart';

class NetworkException extends BaseException {
  NetworkException({String message = "No internet connection"})
      : super(message: message);
}
