import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/models/city.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class MockHomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _remoteSource;

  MockHomeRepositoryImpl(this._remoteSource);

  @override
  Future<List<City>> getCountries() async {
    final response = await _remoteSource.getCountries(mockPath: "country");
    return List<City>.from(response.body.map((x) => City.fromJson(x)));
  }
}
