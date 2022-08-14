import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/modules/home/data/data_source/home_data_source.dart';
import 'package:flutter_template_3/app/modules/home/data/repositories/home_repo_impl.dart';
import 'package:flutter_template_3/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/login/data/repositories/login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/login/data/repositories/mock_login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/login/domain/repositories/login_repo.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 13-08-2022 08:20 PM
///
class ProdRepositoryBindingsGetter implements AppRepositoryBinding {
  @override
  LoginRepository getLoginRepo() =>
      LoginRepositoryImpl(Get.find<LoginDataSource>());

  @override
  HomeRepository getHomeRepo() =>
      HomeRepositoryImpl(Get.find<HomeDataSource>());
}
