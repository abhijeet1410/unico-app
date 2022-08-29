import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
