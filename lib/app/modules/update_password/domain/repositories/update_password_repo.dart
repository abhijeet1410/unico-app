import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';

///
/// Created by Sisira Sahoo
/// On 04/08/22 11:10 AM
///

abstract class UpdatePasswordRepository {
  Future<User> updatePassword(UpdatePasswordRequest updatePassword);
}
