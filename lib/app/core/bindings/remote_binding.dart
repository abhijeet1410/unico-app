import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/core/upload/data/data_source/upload_data_source.dart';
import 'package:flutter_template_3/app/core/upload/data/repositories/upload_repo_impl.dart';
import 'package:flutter_template_3/app/core/upload/domain/repositories/upload_repo.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/repositories/home_repo_impl.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/repositories/remote_login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:flutter_template_3/app/modules/notification/data/data_source/notification_data_source.dart';
import 'package:flutter_template_3/app/modules/notification/data/repositories/notification_repo_impl.dart';
import 'package:flutter_template_3/app/modules/notification/domain/repositories/notification_repo.dart';
import 'package:flutter_template_3/app/modules/splash/data/repositories/remote_splash_repo_impl.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/modules/splash/data/data_source/splash_data_source.dart';
import 'package:flutter_template_3/app/modules/splash/domain/repositories/splash_repo.dart';

class RemoteRepositoryBindingsGetter implements AppRepositoryBinding {
  @override
  LoginRepository getLoginRepo() =>
      RemoteLoginRepositoryImpl(Get.find<LoginDataSource>());

  @override
  HomeRepository getHomeRepo() =>
      RemoteHomeRepositoryImpl(Get.find<HomeDataSource>());

  @override
  SplashRepository getSplashRepo() =>
      RemoteSplashRepositoryImpl(Get.find<SplashDataSource>());

  @override
  UploadRepository getUploadRepo() =>
      UploadRepositoryImpl(Get.find<UploadDataSource>());

  @override
  NotificationRepository getNotificationRepo() =>
      NotificationRepositoryImpl(Get.find<NotificationDataSource>());
}
