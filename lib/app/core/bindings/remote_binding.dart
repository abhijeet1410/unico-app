import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/modules/forgot_password/data/repositories/forgot_password_repo_impl.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/repositories/forgot_pass_impl.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/repositories/forgot_pass_otp_repo.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/repositories/home_repo_impl.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/repositories/remote_login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:flutter_template_3/app/modules/register/data/repositories/remote_register_repo_impl.dart';
import 'package:flutter_template_3/app/modules/splash/data/repositories/remote_splash_repo_impl.dart';
import 'package:flutter_template_3/app/modules/update_password/data/repositories/remote_login_repo_impl.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/modules/forgot_password/data/data_source/forgot_password_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password/domain/repositories/forgot_pass_repo.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/data_source/forgot_pass_otp_source.dart';
import 'package:flutter_template_3/app/modules/register/data/data_source/register_data_source.dart';
import 'package:flutter_template_3/app/modules/register/domain/repositories/register_repo.dart';
import 'package:flutter_template_3/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:flutter_template_3/app/modules/splash/domain/repositories/splash_repo.dart';
import 'package:flutter_template_3/app/modules/update_password/data/data_source/update_password_source.dart';
import 'package:flutter_template_3/app/modules/update_password/domain/repositories/update_password_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RemoteRepositoryBindingsGetter implements AppRepositoryBinding {
  @override
  LoginRepository getLoginRepo() =>
      RemoteLoginRepositoryImpl(Get.find<LoginDataSource>());
  @override
  RegisterRepository getRegisterRepo() =>
      RemoteRegisterRepositoryImpl(Get.find<RegisterDataSource>());

  @override
  HomeRepository getHomeRepo() =>
      RemoteHomeRepositoryImpl(Get.find<HomeDataSource>());

  @override
  SplashRepository getSplashRepo() =>
      RemoteSplashRepositoryImpl(Get.find<SplashDataSource>());

  @override
  ForgotPasswordRepository getForgotRepo() =>
      RemoteForgotPasswordRepositoryImpl(Get.find<ForgotPasswordDataSource>());
  @override
  ForgotPassOtpRepository getForgotOtpRepo() =>
      RemoteForgotPasswordOtpRepoImpl(Get.find<ForgotPasswordOtpDataSource>());

  @override
  UpdatePasswordRepository getUpdatePassword() =>
      RemoteUpdatePasswordRepositoryImpl(Get.find<UpdatePasswordSource>());
}
