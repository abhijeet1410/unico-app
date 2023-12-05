import 'package:unico_app/app/core/bindings/app_repository_binding.dart';
import 'package:unico_app/app/core/bindings/mock_binding.dart';
import 'package:unico_app/app/core/bindings/remote_binding.dart';
import 'package:unico_app/app/core/device/device_info_data_source.dart';
import 'package:unico_app/app/core/device/device_info_data_source_impl.dart';
import 'package:unico_app/app/core/upload/data/data_source/upload_data_source.dart';
import 'package:unico_app/app/core/upload/data/data_source/upload_data_source_impl.dart';
import 'package:unico_app/app/core/upload/domain/usecases/upload_usecase.dart';
import 'package:unico_app/app/core/utils/notification_utils/app_notification.dart';
import 'package:unico_app/app/modules/cart/presentation/controller/cart_controller.dart';
import 'package:unico_app/app/modules/home/data/data_source/home_data_source.dart';
import 'package:unico_app/app/modules/home/data/data_source/home_data_source_impl.dart';
import 'package:unico_app/app/modules/home/presentation/controller/home_controller.dart';
import 'package:unico_app/app/modules/home/presentation/controller/product_controller.dart';
import 'package:unico_app/app/modules/login/data/data_source/login_data_source.dart';
import 'package:unico_app/app/modules/login/data/data_source/login_data_source_impl.dart';
import 'package:unico_app/app/modules/login/domain/usecases/login_with_phone_password_usecase.dart';
import 'package:unico_app/app/modules/login/presentation/controller/login_controller.dart';
import 'package:unico_app/app/modules/login/presentation/controller/user_controller.dart';
import 'package:unico_app/app/modules/notification/data/data_source/notification_data_source.dart';
import 'package:unico_app/app/modules/notification/data/data_source/notification_data_source_impl.dart';
import 'package:unico_app/app/modules/product/presentation/controller/product_detail_controller.dart';
import 'package:unico_app/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:unico_app/app/modules/splash/data/data_source/splash_data_source_impl.dart';
import 'package:unico_app/app/modules/splash/domain/usecases/splash_refresh_token_usecase.dart';
import 'package:unico_app/flavors/build_config.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceInfoDataSource>(() => DeviceInfoDataSourceImpl());

    /// Data sources
    Get.lazyPut<UploadDataSource>(
        () => UploadDataSourceImpl.setContentType("multipart/form-data"),
        fenix: true);
    Get.lazyPut<SplashDataSource>(() => SplashDataSourceImpl());
    Get.lazyPut<LoginDataSource>(() => LoginDataSourceImpl());
    Get.lazyPut<NotificationDataSource>(() => NotificationDataSourceImpl());
    Get.lazyPut<HomeDataSource>(() => HomeDataSourceImpl());

    /// Repositories
    AppRepositoryBinding getter = BuildConfig.instance.config.useMockData
        ? MockRepositoryBindingsGetter()
        : RemoteRepositoryBindingsGetter();

    /// Use cases
    Get.lazyPut(() => SplashRefreshTokenUseCase(getter.getSplashRepo()));
    Get.lazyPut(() => LoginWithPhonePasswordUseCase(getter.getLoginRepo()),
        fenix: true);
    Get.lazyPut<UploadUseCase>(() => UploadUseCase(getter.getUploadRepo()),
        fenix: true);

    /// Controllers

    Get.lazyPut<ProductController>(() => ProductController(), fenix: true);

    Get.put<CartController>(CartController());

    Get.put<UserController>(UserController());
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
