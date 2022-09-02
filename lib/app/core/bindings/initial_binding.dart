import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/core/bindings/mock_binding.dart';
import 'package:flutter_template_3/app/core/bindings/remote_binding.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source_impl.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification_impl.dart';
import 'package:flutter_template_3/app/modules/forgot_password/data/data_source/forgot_password_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password/data/data_source/forgot_password_source_impl.dart';
import 'package:flutter_template_3/app/modules/forgot_password/domain/usecases/forgot_password_usecases.dart';
import 'package:flutter_template_3/app/modules/forgot_password/presentation/controller/forgot_password_controller.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/data_source/forgot_pass_otp_source.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/data_source/forgot_pass_otp_source_impl.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/usecases/forgot_password_otp_usecase.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/presentation/controller/forgot_password_otp_controller.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/home/presentation/controller/home_controller.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/login/domain/usecases/login_with_phone_password_usecase.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/login_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/register/data/data_source/register_data_source.dart';
import 'package:flutter_template_3/app/modules/register/data/data_source/register_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/register/domain/usecases/register_send_phone_otp.dart';
import 'package:flutter_template_3/app/modules/register/domain/usecases/register_with_phone_password_usecase.dart';
import 'package:flutter_template_3/app/modules/register/presentation/controller/register_controller.dart';
import 'package:flutter_template_3/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:flutter_template_3/app/modules/splash/data/data_source/splash_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/splash/domain/usecases/splash_refresh_token_usecase.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/controller/splash_controller.dart';
import 'package:flutter_template_3/app/modules/update_password/data/data_source/update_password_source.dart';
import 'package:flutter_template_3/app/modules/update_password/data/data_source/update_password_source_impl.dart';
import 'package:flutter_template_3/app/modules/update_password/domain/usecases/update_password_usecase.dart';
import 'package:flutter_template_3/app/modules/update_password/presentations/controller/update_password_controller.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppNotificationManager>(AppNotificationManagerImpl())
        .configureInAppNotification(
            reqAlert: true, reqBadge: true, reqSound: true);
    Get.lazyPut<DeviceInfoDataSource>(() => DeviceInfoDataSourceImpl());

    /// Data sources
    Get.lazyPut<SplashDataSource>(() => SplashDataSourceImpl());
    Get.lazyPut<LoginDataSource>(() => LoginDataSourceImpl());
    Get.lazyPut<RegisterDataSource>(() => RegisterDataSourceImpl());
    Get.lazyPut<ForgotPasswordDataSource>(() => ForgotPasswordSourceImpl());
    Get.lazyPut<ForgotPasswordOtpDataSource>(
        () => ForgotPasswordOtpDataSourceImpl());
    Get.lazyPut<UpdatePasswordSource>(() => UpdatePasswordDataSourceImpl());
    Get.lazyPut<HomeDataSource>(() => HomeDataSourceImpl());

    /// Repositories
    AppRepositoryBinding getter = BuildConfig.instance.config.useMockData
        ? MockRepositoryBindingsGetter()
        : RemoteRepositoryBindingsGetter();

    /// Use cases
    Get.lazyPut(() => SplashRefreshTokenUseCase(getter.getSplashRepo()));
    Get.lazyPut(() => LoginWithPhonePasswordUseCase(getter.getLoginRepo()),
        fenix: true);
    Get.lazyPut(() => RegisterSendPhoneOTPUseCase(getter.getRegisterRepo()));
    Get.lazyPut(
        () => RegisterWithPhonePasswordUseCase(getter.getRegisterRepo()));
    Get.lazyPut<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(getter.getForgotRepo()),
        fenix: true);
    Get.lazyPut<ForgotPasswordOtpUseCase>(
        () => ForgotPasswordOtpUseCase(getter.getForgotOtpRepo()),
        fenix: true);
    Get.lazyPut<UpdatePasswordUseCase>(
        () => UpdatePasswordUseCase(getter.getUpdatePassword()),
        fenix: true);

    /// Controllers
    Get.put<UserController>(UserController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(),
        fenix: true);
    Get.lazyPut<ForgotPasswordOtpController>(
        () => ForgotPasswordOtpController(),
        fenix: true);
    Get.lazyPut<UpdatePasswordController>(() => UpdatePasswordController(),
        fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
