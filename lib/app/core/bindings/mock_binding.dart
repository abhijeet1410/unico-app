import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/core/upload/data/data_source/upload_data_source.dart';
import 'package:flutter_template_3/app/core/upload/data/repositories/mock_upload_repo_impl.dart';
import 'package:flutter_template_3/app/core/upload/domain/repositories/upload_repo.dart';
import 'package:flutter_template_3/app/modules/forgot_password/data/data_source/forgot_password_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password/data/repositories/mock_forgot_password_repo_impl.dart';
import 'package:flutter_template_3/app/modules/forgot_password/domain/repositories/forgot_pass_repo.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/data_source/forgot_pass_otp_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/repositories/mock_forgot_pass_impl.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/repositories/forgot_pass_otp_repo.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/repositories/mock_home_repo_impl.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter_template_3/app/modules/items/domain/repositories/items_repo.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/repositories/mock_login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:flutter_template_3/app/modules/notification/data/data_source/notification_data_source.dart';
import 'package:flutter_template_3/app/modules/notification/data/repositories/notification_repo_impl.dart';
import 'package:flutter_template_3/app/modules/notification/domain/repositories/notification_repo.dart';
import 'package:flutter_template_3/app/modules/orders/domain/repositories/orders_repo.dart';
import 'package:flutter_template_3/app/modules/register/data/data_source/register_data_source.dart';
import 'package:flutter_template_3/app/modules/register/data/repositories/mock_register_repo_impl.dart';
import 'package:flutter_template_3/app/modules/register/domain/repositories/register_repo.dart';
import 'package:flutter_template_3/app/modules/slots/domain/repositories/slots_repo.dart';
import 'package:flutter_template_3/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:flutter_template_3/app/modules/splash/data/repositories/mock_splash_repo_impl.dart';
import 'package:flutter_template_3/app/modules/splash/domain/repositories/splash_repo.dart';
import 'package:flutter_template_3/app/modules/update_password/data/data_source/update_password_source.dart';
import 'package:flutter_template_3/app/modules/update_password/data/repositories/mock_login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/update_password/domain/repositories/update_password_repo.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

///
/// Created by Sunil Kumar
/// On 13-08-2022 08:19 PM
///
class MockRepositoryBindingsGetter implements AppRepositoryBinding {
  @override
  LoginRepository getLoginRepo() =>
      MockLoginRepositoryImpl(Get.find<LoginDataSource>());
  @override
  RegisterRepository getRegisterRepo() =>
      MockRegisterRepositoryImpl(Get.find<RegisterDataSource>());

  @override
  HomeRepository getHomeRepo() =>
      MockHomeRepositoryImpl(Get.find<HomeDataSource>());

  @override
  SplashRepository getSplashRepo() =>
      MockSplashRepositoryImpl(Get.find<SplashDataSource>());

  @override
  ForgotPasswordRepository getForgotPasswordRepo() =>
      MockForgotPasswordRepositoryImpl(Get.find<ForgotPasswordDataSource>());
  @override
  ForgotPassOtpRepository getForgotOtpRepo() =>
      MockForgotPasswordOtpRepoImpl(Get.find<ForgotPasswordOtpDataSource>());

  @override
  UpdatePasswordRepository getUpdatePassword() {
    return MockUpdatePasswordRepositoryImpl(Get.find<UpdatePasswordSource>());
  }

  @override
  UploadRepository getUploadRepo() =>
      MockUploadRepositoryImpl(Get.find<UploadDataSource>());

  @override
  NotificationRepository getNotificationRepo() =>
      NotificationRepositoryImpl(Get.find<NotificationDataSource>());

  @override
  ItemsRepository getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  OrdersRepository getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  SlotsRepository getSlots() {
    // TODO: implement getSlots
    throw UnimplementedError();
  }
}
