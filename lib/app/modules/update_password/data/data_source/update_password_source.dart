
import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';
import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api.dart';
import 'package:get/get.dart';

///
/// Created by Sisira Sahoo
/// On 04/08/22 11:10 AM
///

abstract class UpdatePasswordSource extends BaseProvider {
  Future<Response> updatePassword(UpdatePasswordRequest updatePassword,
      {String? mockPath});
}
