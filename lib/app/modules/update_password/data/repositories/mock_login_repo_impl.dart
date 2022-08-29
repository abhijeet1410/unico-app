import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/update_password/data/data_source/update_password_source.dart';
import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';
import 'package:flutter_template_3/app/modules/update_password/domain/repositories/update_password_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class MockUpdatePasswordRepositoryImpl implements UpdatePasswordRepository {
  final UpdatePasswordSource _remoteSource;

  MockUpdatePasswordRepositoryImpl(this._remoteSource);

  @override
  Future<User> updatePassword(UpdatePasswordRequest updatePassword) async {
    final response = await _remoteSource.updatePassword(updatePassword,
        mockPath: 'updatePassword');
    return User.fromJson(response.body);
  }
}
