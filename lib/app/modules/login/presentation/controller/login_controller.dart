import 'dart:developer';

import 'package:flutter/material.dart';
 import 'package:flutter_template_3/app/core/utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/login/data/models/login_request_model.dart';
import 'package:flutter_template_3/app/modules/login/domain/usecases/login_with_email_password_usecase.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class LoginController extends GetxController {
  late RxBool isObscure;
  String _emailId = '', _password = '';
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
    _emailId = newValue!.trim();
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
        final res = await Get.find<LoginWithEmailPasswordUseCase>().call(
            LoginRequestModel(
                action: "authentication",
                locale: "en",
                email: _emailId,
                password: _password,
                timeZoneOffset: "+5.30"));
        Get.find<PreferenceManager>().storeAccessToken(res.accessToken!);
        Get.find<UserController>().updateUser(res.user);
        print("LOGIN SUCCESS ${Get.find<PreferenceManager>().accessToken}");
        Get.offAllNamed(DashboardPage.routeName);
      } catch (e, s) {
        log("LOGIN ERROR ${e}", stackTrace: s);
        SnackBarHelper.show(e.toString());
      }
      buttonKey.currentState?.hideLoader();
      // Future.delayed(Duration(seconds: 3)).then((value) {

      // Get.offAllNamed(DashboardPage.routeName);
      // });
      // buttonKey.currentState?.showLoader();
      // AuthHelper.userLoginWithEmailOrPhone(_emailId, _password)
      //     .then((response) {})
      //     .catchError((err, s) {
      //   log('$err $s');
      //   if (err is RestError) {
      //     if (err.code == 425) {
      //       SnackBarHelper.show('New User', 'Please sign up to continue');
      //       Get.toNamed(RegisterPage.routeName,
      //           arguments: {"email": _emailId, "password": _password});
      //     } else {
      //       SnackBarHelper.show('Error', '$err');
      //     }
      //   } else {
      //     SnackBarHelper.show('Error', '$err');
      //   }
      // }).whenComplete(() => {buttonKey.currentState?.hideLoader()});
    }
  }

  void socialSignIn(int type) async {
    //   Get.key!.currentState!.push(LoaderOverlay());
    //   try {
    //     SocialSignInResponse? user;
    //     switch (type) {
    //       case 1:
    //         user = await AuthHelper.userLoginWithGoogle();
    //         break;

    //       case 2:
    //         user = await AuthHelper.userLoginWithFacebook();
    //         break;

    //       case 3:
    //         user = await AuthHelper.userLoginWithApple();
    //         break;
    //     }
    //     if (user != null) {
    //       Get.offAndToNamed(RegisterPage.routeName,
    //           arguments: {"email": user.email, "name": user.name});
    //     }
    //   } catch (err, s) {
    //     Get.key!.currentState!.pop();
    //     log('$err $s');
    //     // SnackBarHelper.show('Error', '$err');
    //   }
  }
}
