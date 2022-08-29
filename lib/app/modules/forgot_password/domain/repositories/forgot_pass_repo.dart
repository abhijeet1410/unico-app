import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';

///
/// Created by Sisira Sahoo
/// On 17/08/22 6:09 PM
///

abstract class ForgotPasswordRepository {
  Future<UserResponse> forgotPassword(LoginRequestModel forgotData);
}
