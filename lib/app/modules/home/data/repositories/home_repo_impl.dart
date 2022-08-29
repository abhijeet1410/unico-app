import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/models/city.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_otp_response.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:get/get.dart';

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
