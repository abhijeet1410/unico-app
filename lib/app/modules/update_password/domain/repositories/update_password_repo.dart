import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class UpdatePasswordRepository {
  Future<User> updatePassword(UpdatePasswordRequest updatePassword);
}
