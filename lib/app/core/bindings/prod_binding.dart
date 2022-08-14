import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/login/data/repository/login_repo_impl.dart';
import 'package:flutter_template_3/app/modules/login/data/repository/mock_login_repo_impl.dart';
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
}
