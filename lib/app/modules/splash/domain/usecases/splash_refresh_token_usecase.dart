import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:flutter_template_3/app/modules/splash/domain/repositories/splash_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class SplashRefreshTokenUseCase
    extends UseCase<UserResponse, RefreshTokenRequestModel> {
  late final SplashRepository repository;

  SplashRefreshTokenUseCase(this.repository);

  @override
  Future<UserResponse> call(RefreshTokenRequestModel params) =>
      repository.refreshAccessToken(params);
}
