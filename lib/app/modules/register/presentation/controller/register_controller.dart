import 'dart:developer';

import 'package:flutter_template_3/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:flutter_template_3/app/core/utils/validators/app_validators.dart';
import 'package:flutter_template_3/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/core/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/register/data/models/register_phone_password_request_model.dart';
import 'package:flutter_template_3/app/modules/register/domain/usecases/register_send_phone_otp.dart';
import 'package:flutter_template_3/app/modules/register/domain/usecases/register_with_phone_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RegisterController extends GetxController {
  String _name = '', _phone = '', _pin = '';
  String? previousPhone;
  String? referralCode;
  late RxBool isObscure;
  late RxBool isObscure1;
  late RxInt referral;
  String _newPassword = '', _confirmPassword = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<AppPrimaryButtonState> buttonKey =
      GlobalKey<AppPrimaryButtonState>();
  late Rx<AutovalidateMode> autoValidateMode;
  TextEditingController phoneController = TextEditingController();

  RxnString phoneError = RxnString();
  @override
  void onInit() {
    super.onInit();
    isObscure = RxBool(true);
    isObscure1 = RxBool(true);
    referral = RxInt(0);
    autoValidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    isObscure.close();
    isObscure1.close();
    autoValidateMode.close();
    phoneController.dispose();
    super.dispose();
  }

  void updateReferral(int? b) {
    referral.value = referral.value == 1 ? 0 : 1;
  }

  void onReferralCodeSaved(String? newValue) {
    referralCode = newValue!.trim();
  }

  void onOtpSaved(String? newValue) {
    _pin = newValue!.trim();
  }

  void onNameSaved(String? newValue) {
    _name = newValue!.trim();
  }

  void onPhoneSaved(String? newValue) {
    _phone = newValue!.trim();
  }

  void onConfirmPasswordSaved(String? newValue) {
    _confirmPassword = newValue!.trim();
  }

  String? confirmPasswordValidator(String? value, BuildContext context) {
    if (value?.trim() != _newPassword) return "Passwords didn't match";
    return null;
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

  void register() async {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      buttonKey.currentState?.showLoader();
      try {
        final token = Get.find<PreferenceManager>().accessToken;
        final param = RegisterPhonePasswordRequestModel(
            phone: _phone,
            password: _confirmPassword,
            purpose: 1,
            otp: _pin,
            name: _name,
            registrationToken: token ?? "",
            role: 1);
        final res =
            await Get.find<RegisterWithPhonePasswordUseCase>().call(param);
        final preferenceManager = Get.find<PreferenceManager>();
        preferenceManager.storeAccessToken(res.accessToken ?? "");

        Get.find<UserController>().updateUser(res.user);
        NavigationHelper.offAllNamed(DashboardPage.routeName);
      } catch (e, s) {
        AppSnackBarUtil.show(e.toString());
      } finally {
        buttonKey.currentState?.hideLoader();
      }
      // Future.delayed(const Duration(seconds: 2)).then((value) {
      //   buttonKey.currentState?.hideLoader();
      //   Get.offAllNamed(DashboardPage.routeName);
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

  void sendPhoneOTP() {
    phoneError.value = null;
    final phone = phoneController.text.trim();
    final err = AppFormValidators.validatePhone(phone);
    if (err == null) {
      Get.find<RegisterSendPhoneOTPUseCase>()
          .call(RegisterPhoneOtpRequestModel(phone: phone, purpose: 1))
          .then((value) {
        previousPhone = phone;
        AppSnackBarUtil.show("OTP sent successfully to $phone");
      }).catchError((e, s) {
        log("ERROR $e", stackTrace: s);
        AppSnackBarUtil.show(e.toString());
      });
    } else {
      phoneError.value = err;
    }
  }
}
