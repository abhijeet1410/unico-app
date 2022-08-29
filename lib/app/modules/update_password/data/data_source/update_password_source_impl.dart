import 'package:flutter_template_3/app/modules/update_password/data/data_source/update_password_source.dart';
import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:get/get.dart';

///
/// Created by Sisira Sahoo
/// On 04/08/22 11:10 AM
///

class UpdatePasswordDataSourceImpl extends UpdatePasswordSource {
  @override
  Future<Response> updatePassword(UpdatePasswordRequest updatePassword,
      {String? mockPath}) {
    return patch(
      "${AppApiRoutes.user}/${updatePassword.id}",
      updatePassword.toJson(),
      mockPath: mockPath,
      authRequired: false,
    );
  }
}
