import 'package:unico_app/app/core/bindings/app_repository_binding.dart';
import 'package:unico_app/app/core/upload/data/data_source/upload_data_source.dart';
import 'package:unico_app/app/core/upload/data/repositories/mock_upload_repo_impl.dart';
import 'package:unico_app/app/core/upload/domain/repositories/upload_repo.dart';
import 'package:unico_app/app/modules/home/data/data_source/home_data_source.dart';
import 'package:unico_app/app/modules/home/data/repositories/mock_home_repo_impl.dart';
import 'package:unico_app/app/modules/home/domain/repositories/home_repository.dart';
import 'package:unico_app/app/modules/login/data/data_source/login_data_source.dart';
import 'package:unico_app/app/modules/login/data/repositories/mock_login_repo_impl.dart';
import 'package:unico_app/app/modules/login/domain/repositories/login_repo.dart';
import 'package:unico_app/app/modules/notification/data/data_source/notification_data_source.dart';
import 'package:unico_app/app/modules/notification/data/repositories/notification_repo_impl.dart';
import 'package:unico_app/app/modules/notification/domain/repositories/notification_repo.dart';
import 'package:unico_app/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:unico_app/app/modules/splash/data/repositories/mock_splash_repo_impl.dart';
import 'package:unico_app/app/modules/splash/domain/repositories/splash_repo.dart';
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
  HomeRepository getHomeRepo() =>
      MockHomeRepositoryImpl(Get.find<HomeDataSource>());

  @override
  SplashRepository getSplashRepo() =>
      MockSplashRepositoryImpl(Get.find<SplashDataSource>());


  @override
  UploadRepository getUploadRepo() =>
      MockUploadRepositoryImpl(Get.find<UploadDataSource>());

  @override
  NotificationRepository getNotificationRepo() =>
      NotificationRepositoryImpl(Get.find<NotificationDataSource>());
}
