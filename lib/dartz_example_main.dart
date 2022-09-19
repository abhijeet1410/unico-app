import 'package:dartz/dartz.dart';

void main() async {
  dynamic loginResult = await login("sk@gmail.com", "1234");
  loginResult.fold((String l) {
    // Login success  l
  }, (bool r) {
    // Login fail  r
  });
}

Future<Either<String, bool>> login(String email, String password) async {
  await Future<dynamic>.delayed(const Duration(seconds: 2));

  if (email == "sk@gmail.com" && password == "1234") {
    return const Right<String, bool>(true);
  } else if (email == "sk@gmail.com" && password != "1234") {
    return const Left<String, bool>("Invalid credentials");
  } else {
    return const Left<String, bool>("Some error occurred");
  }
}
