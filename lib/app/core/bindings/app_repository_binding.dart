import 'package:flutter_template_3/app/modules/forgot_password/domain/repositories/forgot_pass_repo.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/repositories/forgot_pass_otp_repo.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:flutter_template_3/app/modules/register/domain/repositories/register_repo.dart';
import 'package:flutter_template_3/app/modules/splash/domain/repositories/splash_repo.dart';
import 'package:flutter_template_3/app/modules/update_password/domain/repositories/update_password_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class AppRepositoryBinding {
  SplashRepository getSplashRepo();
  LoginRepository getLoginRepo();
  RegisterRepository getRegisterRepo();
  ForgotPasswordRepository getForgotRepo();
  ForgotPassOtpRepository getForgotOtpRepo();
  UpdatePasswordRepository getUpdatePassword();

  HomeRepository getHomeRepo();
}
