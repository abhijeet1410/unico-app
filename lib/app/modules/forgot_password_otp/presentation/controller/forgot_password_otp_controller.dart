import 'dart:async';
import 'dart:developer';

import 'package:flutter_template_3/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/data/models/forgot_pass_otp_request_model.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/domain/usecases/forgot_password_otp_usecase.dart';
import 'package:flutter_template_3/app/modules/update_password/update_password_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ForgotPasswordOtpController extends GetxController {
  String pin = "";
  RxBool isResendActive = RxBool(false);
  late Timer _timer;
  RxInt timerCounter = RxInt(59);
  final GlobalKey<AppPrimaryButtonState> buttonKey =
      GlobalKey<AppPrimaryButtonState>();
  final GlobalKey<AppPrimaryButtonState> buttonKey1 =
      GlobalKey<AppPrimaryButtonState>();
  late String phone;
  late TextEditingController? textController;

  // ForgotPasswordOtpController(this.phone); // bool _isFromOnBoarding = false;

  String get timerText =>
      '00:${timerCounter < 10 ? timerCounter.toString().padLeft(2, '0') : timerCounter}';

  void onCodeUpdated(String code) {
    textController?.text = code;
  }

  @override
  void onInit() {
    super.onInit();
    final map = Get.arguments;
    phone = map;
    textController = TextEditingController();
    SmsAutoFill().getAppSignature.then((value) {
      log("APP SIGNATURE $value");
    });

    //   //_isFromOnBoarding = map['isFromOnBoarding'] ?? false;
    // }
    _listenOtp();
    startTimer();
    // Future.delayed(const Duration(minutes: 1), () {
    //   isResendActive = true;
    // });
  }

  @override
  void dispose() {
    _timer.cancel();
    timerCounter.close();
    isResendActive.close();
    textController?.dispose();
    textController = null;
    super.dispose();
  }

  Future<void> _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        isResendActive.value = timerCounter < 15;

        if (timerCounter.value < 1) {
          timer.cancel();
        } else {
          timerCounter.value -= 1;
        }
      },
    );
  }

  Future regenerateOTP() async {
    _timer.cancel();
    isResendActive.value = false;
    timerCounter.value = 59;
    buttonKey1.currentState?.showLoader();
    try {
      final param = ForgotPassWordOtpRequestModel(
        phone: phone,
        otp: pin,
        purpose: 4,
      );
      await Get.find<ForgotPasswordOtpUseCase>().call(param);
      AppSnackBarUtil.show("Otp sent your mobile number");
    } catch (e, s) {
      AppSnackBarUtil.show(e.toString());
      log("message", error: e, stackTrace: s);
    } finally {
      buttonKey1.currentState?.hideLoader();
    }
  }

  void verify() {
    if (pin.isEmpty) {
      AppSnackBarUtil.show("Please enter pin to continue");
    } else {
      _forgotOtp();
    }
  }

  Future<void> _forgotOtp() async {
    Get.focusScope!.unfocus();
    if (pin.isEmpty || pin.length != 4) {
      AppSnackBarUtil.show("Please enter pin to continue");
    } else {
      buttonKey.currentState?.showLoader();
      try {
        final param = ForgotPassWordOtpRequestModel(
          phone: phone,
          otp: pin,
          purpose: 4,
        );
        final res = await Get.find<ForgotPasswordOtpUseCase>().call(param);
        Get.toNamed(UpdatePasswordPage.routeName,
            arguments: {"id": res.id, "token": res.token});
      } catch (e, s) {
        AppSnackBarUtil.show(e.toString());
        log("message", error: e, stackTrace: s);
      } finally {
        buttonKey.currentState?.hideLoader();
      }
    }
  }

  void onChanged(String value) {
    pin = value.trim();
  }

  void onCompleted(String value) {
    pin = value.trim();
    _forgotOtp();
  }
}
