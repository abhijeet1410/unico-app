abstract class Failure {
  late final String errorMessage;
  late final int? statusCode;
  Failure(this.errorMessage, [this.statusCode]);
}

class ServerFailure extends Failure {
  late final String errorMessage;
  late final int? statusCode;
  late final String? apiStatusCode;
  ServerFailure(
      {required this.errorMessage,
      required this.statusCode,
      this.apiStatusCode})
      : super(errorMessage, statusCode);

  @override
  List<Object?> get props => [errorMessage, statusCode];
}

class InternetConnection extends Failure {
  InternetConnection(errorMessage, [statusCode])
      : super(errorMessage, statusCode);
  @override
  List<Object?> get props => [errorMessage, statusCode];
}
