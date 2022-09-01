import 'dart:developer';

import 'package:flutter_template_3/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/forgot_password/domain/usecases/forgot_password_usecases.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/forgot_password_otp_page.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ForgotPasswordController extends GetxController {
  late RxBool isObscure;
  String _phone = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<AppPrimaryButtonState> buttonKey =
      GlobalKey<AppPrimaryButtonState>();
  late Rx<AutovalidateMode> autoValidateMode;
  @override
  void onInit() {
    super.onInit();
    isObscure = RxBool(true);
    autoValidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    isObscure.close();
    autoValidateMode.close();
    super.dispose();
  }

  void onPhoneSaved(String? newValue) {
    _phone = newValue!.trim();
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '*required';
    }
    return null;
  }

  void toggleObscure() {
    isObscure.value = !(isObscure.value);
  }

  Future<void> forgot() async {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      buttonKey.currentState?.showLoader();
      // Get.toNamed(ForgotPasswordOtpPage.routeName, arguments: _phone);
      try {
        final param = LoginRequestModel(
            locale: "en", timeZoneOffset: "+5.30", phone: _phone, purpose: 4);
        await Get.find<ForgotPasswordUseCase>().call(param).then((value) {
          AppSnackBarUtil.show("Otp sent to your $_phone");
          Get.toNamed(ForgotPasswordOtpPage.routeName, arguments: _phone);
        });
      } catch (e, s) {
        log("forgot msg ", error: e, stackTrace: s);
      } finally {
        buttonKey.currentState?.hideLoader();
      }
    }
  }
}
