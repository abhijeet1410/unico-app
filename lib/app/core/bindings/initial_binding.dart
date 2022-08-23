import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/core/bindings/mock_binding.dart';
import 'package:flutter_template_3/app/core/bindings/prod_binding.dart';
import 'package:flutter_template_3/app/core/device/DeviceInfoDataSource.dart';
import 'package:flutter_template_3/app/core/device/DeviceInfoDataSourceImpl.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification_impl.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/home/domain/usecases/home_countries_usecase.dart';
import 'package:flutter_template_3/app/modules/home/presentation/controller/home_controller.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/login/data/repositories/mock_login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:flutter_template_3/app/modules/login/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/login_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/core/bindings/local_source_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    /// Global dependencies
    LocalSourceBindings().dependencies();
    Get.put<UserController>(UserController());
    Get.put<AppNotificationManager>(AppNotificationManagerImpl())
        .configureInAppNotification(
            reqAlert: true, reqBadge: true, reqSound: true);
    Get.lazyPut<DeviceInfoDataSource>(() => DeviceInfoDataSourceImpl());

    /// Data sources
    Get.lazyPut<LoginDataSource>(() => LoginDataSourceImpl());
    Get.lazyPut<HomeDataSource>(() => HomeDataSourceImpl());

    /// Repositories
    AppRepositoryBinding getter = BuildConfig.instance.config.useMockData
        ? MockRepositoryBindingsGetter()
        : ProdRepositoryBindingsGetter();

    /// Use cases
    Get.lazyPut(() => LoginWithEmailPasswordUseCase(getter.getLoginRepo()));
    Get.lazyPut(() => HomeCountriesUseCase(getter.getHomeRepo()));

    /// Controllers
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
