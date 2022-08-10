import 'package:dartz/dartz.dart';

void main() async {
  final loginResult = await login("sk@gmail.com", "1234");
  loginResult.fold((l) {
    print("Login success $l");
  }, (r) {
    print("Login fail $r");
  });
}

Future<Either<String, bool>> login(String email, String password) async {
  await Future.delayed(const Duration(seconds: 2));

  if (email == "sk@gmail.com" && password == "1234") {
    return const Right(true);
  } else if (email == "sk@gmail.com" && password != "1234") {
    return const Left("Invalid credentials");
  } else {
    return const Left("Some error occurred");
  }
}
