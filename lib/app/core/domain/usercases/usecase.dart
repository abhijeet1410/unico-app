import 'package:dartz/dartz.dart';
import 'package:flutter_template_3/app/core/data/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
