import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';
import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class UpdatePasswordSource extends BaseProvider {
  Future<Response> updatePassword(UpdatePasswordRequest updatePassword,
      {String? mockPath});
}
