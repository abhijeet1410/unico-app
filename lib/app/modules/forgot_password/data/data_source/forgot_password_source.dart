import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class ForgotPasswordDataSource extends BaseProvider {
  Future<Response> forgotPassword(LoginRequestModel forgotData,
      {String? mockPath});
}
