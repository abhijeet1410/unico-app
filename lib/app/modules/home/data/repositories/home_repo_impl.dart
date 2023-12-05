import 'package:unico_app/app/modules/home/data/data_source/home_data_source.dart';
import 'package:unico_app/app/modules/home/data/models/city.dart';
import 'package:unico_app/app/modules/home/domain/repositories/home_repository.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class RemoteHomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _remoteSource;

  RemoteHomeRepositoryImpl(this._remoteSource);

  @override
  Future<List<City>> getCountries() async {
    final response = await _remoteSource.getCountries();
    return List<City>.from(response.body.map((x) => City.fromJson(x)));
  }
}
