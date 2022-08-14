import 'package:flutter_template_3/app/core/bindings/app_repository_binding.dart';
import 'package:flutter_template_3/app/core/bindings/mock_binding.dart';
import 'package:flutter_template_3/app/core/bindings/prod_binding.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source.dart';
import 'package:flutter_template_3/app/modules/login/data/data_source/login_data_source_impl.dart';
import 'package:flutter_template_3/app/modules/login/data/repository/mock_login_repo_impl.dart';
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
    LocalSourceBindings().dependencies();
    Get.put<UserController>(UserController());
    Get.lazyPut<LoginDataSource>(() => LoginDataSourceImpl());
    AppRepositoryBinding getter = BuildConfig.instance.config.useMockData
        ? MockRepositoryBindingsGetter()
        : ProdRepositoryBindingsGetter();
    Get.lazyPut(() => LoginWithEmailPasswordUseCase(getter.getLoginRepo()));
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
