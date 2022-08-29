///
/// Created by Sunil Kumar from Boiler plate
///

abstract class BaseException implements Exception {
  final String message;

  BaseException({this.message = ""});
  @override
  String toString() => message;
}
