import 'dart:developer';

import 'package:flutter_template_3/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/update_password/data/models/update_password_request_model.dart';
import 'package:flutter_template_3/app/modules/update_password/domain/usecases/update_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sisira Sahoo
/// On 04/08/22 11:10 AM
///

class UpdatePasswordController extends GetxController {
  late RxBool isObscure;
  late RxBool isObscure1;
  String _newPassword = '', _confirmPassword = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<AppPrimaryButtonState> buttonKey =
      GlobalKey<AppPrimaryButtonState>();
  late Rx<AutovalidateMode> autoValidateMode;
  late String id, token;
  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic>? map = Get.arguments;
    if (map != null) {
      id = map["id"];
      token = map["token"];
    }
    isObscure = RxBool(true);
    isObscure1 = RxBool(true);
    autoValidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    isObscure.close();
    isObscure1.close();
    autoValidateMode.close();
    super.dispose();
  }

  void onConfirmPasswordSaved(String? newValue) {
    _confirmPassword = newValue!.trim();
  }

  String? confirmPasswordValidator(String? value, BuildContext context) {
    if (value?.trim() != _newPassword) return "Passwords didn't match";
  }

  void onNewPasswordSaved(String? newValue) {
    _newPassword = newValue!.trim();
  }

  void toggleObscure() {
    isObscure.value = !(isObscure.value);
  }

  void toggleObscure1() {
    isObscure1.value = !(isObscure1.value);
  }

  Future<void> resetPassword() async {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      buttonKey.currentState?.showLoader();

      try {
        final param =
            UpdatePasswordRequest(password: _newPassword, token: token, id: id);
        await Get.find<UpdatePasswordUseCase>().call(param);
        Get.offAllNamed(
          LoginPage.routeName,
        );
      } catch (e, s) {
        AppSnackBarUtil.show(e.toString());
        log("message", error: e, stackTrace: s);
      } finally {
        buttonKey.currentState?.hideLoader();
      }
    }
  }
}
