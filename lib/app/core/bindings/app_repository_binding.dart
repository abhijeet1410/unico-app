import 'package:unico_app/app/core/upload/domain/repositories/upload_repo.dart';
import 'package:unico_app/app/modules/home/domain/repositories/home_repository.dart';
import 'package:unico_app/app/modules/login/domain/repositories/login_repo.dart';
import 'package:unico_app/app/modules/notification/domain/repositories/notification_repo.dart';
import 'package:unico_app/app/modules/splash/domain/repositories/splash_repo.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class AppRepositoryBinding {
  SplashRepository getSplashRepo();
  LoginRepository getLoginRepo();
  UploadRepository getUploadRepo();
  HomeRepository getHomeRepo();
  NotificationRepository getNotificationRepo();
}
