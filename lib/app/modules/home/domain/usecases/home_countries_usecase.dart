import 'package:unico_app/app/core/domain/entities/request.dart';
import 'package:unico_app/app/modules/home/data/models/city.dart';
import 'package:unico_app/app/modules/home/domain/repositories/home_repository.dart';
import 'package:unico_app/app/modules/login/data/models/login_request_model.dart';
import 'package:unico_app/app/modules/login/data/models/user.dart';
import 'package:unico_app/app/core/domain/usercases/usecase.dart';
import 'package:unico_app/app/modules/login/domain/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';

///
/// Created by Sunil Kumar
/// On 13-08-2022 10:03 AM
///
class HomeCountriesUseCase extends UseCase<List<City>, NoRequest> {
  late final HomeRepository repository;

  HomeCountriesUseCase(this.repository);

  @override
  Future<List<City>> call(NoRequest params) => repository.getCountries();
}
