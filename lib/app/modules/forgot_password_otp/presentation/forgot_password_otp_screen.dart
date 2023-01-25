import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/presentation/controller/forgot_password_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ForgotPasswordOtpScreen extends GetView<ForgotPasswordOtpController> {
  const ForgotPasswordOtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mainColor = Get.theme.primaryColor;
    final backGroundColor = Get.theme.backgroundColor;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Container(
              height: size.height / 4,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Color(0xff507295), Color(0xff09395D)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 0.0, bottom: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.white.withOpacity(0.5),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: backGroundColor,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                          ],
                        ),
                        const Text(
                          'Forgot password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
              children: <Widget>[
                SizedBox(
                  height: size.height / 8,
                ),
                Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(
                        left: 0, right: 0, top: 40, bottom: 20),
                    child: PinCodeTextField(
                      // controller: _otpController.textController,
                      appContext: context,
                      length: 4, enableActiveFill: true,
                      // backgroundColor: Colors.red,
                      autoDisposeControllers: false,
                      onChanged: controller.onChanged,
                      onSubmitted: controller.onCompleted,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      onCompleted: (s) {
                        controller.verify();
                      },
                      pinTheme: PinTheme(
                          fieldHeight: 50,
                          fieldWidth: 44,
                          shape: PinCodeFieldShape.box,
                          borderWidth: 1,
                          activeFillColor: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          selectedColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Code was send your mobile number",
                        style:
                            TextStyle(color: Color(0xffACBAC3), height: 1.4)),
                    Text("+91 ${controller.phone}",
                        style: TextStyle(color: Color(0xff126881)))
                  ],
                ),
                SizedBox(
                  height: size.height / 7,
                ),
                Text('This code will expire on 5 minutes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: mainColor,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 30,
                ),
                AppPrimaryButton(
                    key: controller.buttonKey,
                    onPressed: controller.verify,
                    child: Text("Verify code".toUpperCase())),
                const SizedBox(
                  height: 10,
                ),
                AppPrimaryButton(
                    key: controller.buttonKey1,
                    color: const Color(0xffFFBE38),
                    onPressed: controller.regenerateOTP,
                    child: Text("RESEND CODE".toUpperCase())),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
