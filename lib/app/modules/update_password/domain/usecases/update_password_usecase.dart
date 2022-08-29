import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';
import 'package:flutter_template_3/app/modules/update_password/domain/repositories/update_password_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class UpdatePasswordUseCase extends UseCase<User, UpdatePasswordRequest> {
  late final UpdatePasswordRepository updatePasswordRepository;

  UpdatePasswordUseCase(this.updatePasswordRepository);

  @override
  Future<User> call(UpdatePasswordRequest params) =>
      updatePasswordRepository.updatePassword(params);
}
