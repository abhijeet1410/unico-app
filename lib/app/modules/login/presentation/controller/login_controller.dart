import 'dart:developer';

import 'package:flutter_template_3/app/modules/login/domain/usecases/login_with_phone_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class LoginController extends GetxController {
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
        final param = LoginRequestModel(
            strategy: "phone",
            locale: "en",
            phone: _phone,
            password: _password,
            timeZoneOffset: "+5.30");
        final res = await Get.find<LoginWithPhonePasswordUseCase>().call(param);
        final preferenceManager = Get.find<PreferenceManager>();
        preferenceManager.storeAccessToken(res.accessToken!);

        Get.find<UserController>().updateUser(res.user);
        Get.offAllNamed(DashboardPage.routeName);
      } catch (e, s) {
        AppSnackBarUtil.show(e.toString());
      } finally {
        buttonKey.currentState?.hideLoader();
      }
    }
  }
}
