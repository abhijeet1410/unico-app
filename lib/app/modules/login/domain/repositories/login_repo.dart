import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class LoginRepository {
  Future<UserResponse> loginWithPhonePassword(LoginRequestModel loginData);
}
