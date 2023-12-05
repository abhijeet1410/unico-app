import 'package:unico_app/app/core/base/base_controller.dart';
import 'package:unico_app/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:unico_app/app/modules/home/presentation/home_page.dart';
import 'package:unico_app/app/modules/login/domain/usecases/login_with_phone_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:unico_app/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:unico_app/app/core/local/preference/preference_manager.dart';
import 'package:unico_app/app/modules/login/data/models/login_request_model.dart';
import 'package:unico_app/app/modules/login/presentation/controller/user_controller.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class LoginController extends BaseController {
  late RxBool isObscure;
  String _phone = '', _password = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<AppPrimaryButtonState> buttonKey =
      GlobalKey<AppPrimaryButtonState>();
  late Rx<AutovalidateMode> autoValidateMode;

  @override
  void onInit() {
    super.onInit();
    isObscure = RxBool(false);
    autoValidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    isObscure.close();
    autoValidateMode.close();
    super.dispose();
  }

  void onEmailSaved(String? newValue) {
    _phone = newValue!.trim();
  }

  void onPasswordSaved(String? newValue) {
    _password = newValue!.trim();
  }

  void toggleObscure() {
    isObscure.value = !(isObscure.value);
  }

  void loginEmailAddress() async {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      buttonKey.currentState?.showLoader();
      try {
        if(_phone == 'a@a.com' && _password == '12345678'){
          print("aaa");
          NavigationHelper.offAllNamed(DashboardPage.routeName);
        }
      } catch (e, s) {
        AppSnackBarUtil.show(e.toString());
      } finally {
        buttonKey.currentState?.hideLoader();
      }
    }
  }

  @override
  Future loadData() {
    // TODO: implement loadData
    throw UnimplementedError();
  }

  @override
  Future loadMoreData() {
    // TODO: implement loadMoreData
    throw UnimplementedError();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
