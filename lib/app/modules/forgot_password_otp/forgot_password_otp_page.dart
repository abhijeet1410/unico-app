import 'package:flutter_template_3/app/modules/forgot_password_otp/presentation/controller/forgot_password_otp_controller.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/presentation/forgot_password_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

///
/// Created by Sisira Sahoo
/// On 03/08/22 3:59 PM
///

class ForgotPasswordOtpPage extends StatefulWidget {
  static const routeName = '/forgotOtp';
  const ForgotPasswordOtpPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordOtpPage> createState() => _ForgotPasswordOtpPageState();
}

class _ForgotPasswordOtpPageState extends State<ForgotPasswordOtpPage>
    with CodeAutoFill {
  late ForgotPasswordOtpController controller;
  late String phone;
  @override
  void initState() {
    super.initState();
    controller = Get.put(ForgotPasswordOtpController());
  }

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordOtpScreen();
  }

  @override
  void codeUpdated() {
    return controller.onCodeUpdated(code!);
  }
}
