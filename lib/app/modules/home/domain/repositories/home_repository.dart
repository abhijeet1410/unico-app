import 'package:unico_app/app/modules/home/data/models/city.dart';
import 'package:unico_app/app/modules/login/data/models/login_otp_response.dart';
import 'package:unico_app/app/modules/login/data/models/login_request_model.dart';
import 'package:unico_app/app/modules/login/data/models/user.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 06:51 PM
///
abstract class HomeRepository {
  Future<List<City>> getCountries();
}
