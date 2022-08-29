import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/modules/forgot_password/forgot_password_page.dart';
import 'package:flutter_template_3/app/modules/register/presentation/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/decorations/app_decorations.dart';
import 'package:flutter_template_3/app/core/utils/validators/app_validators.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/login_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:14 PM
///
class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(() => GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Form(
                key: controller.formKey,
                autovalidateMode: controller.autoValidateMode.value,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: size.height / 4,
                      width: size.width,
                      decoration: const BoxDecoration(
                        // color: Get.theme.primaryColor,
                        gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xff507295),
                              Color(0xff09395D)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0),
                        ),
                      ),
                      child: const SafeArea(
                        bottom: false,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Log in',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              height: 6,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      children: [
                        Column(
                          children: <Widget>[
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Get
                                          .theme.textSelectionTheme.cursorColor,
                                      height: 1.4),
                                  textAlignVertical: TextAlignVertical.center,
                                  validator: (val) {
                                    return AppFormValidators.validatePhone(val);
                                  },
                                  textAlign: TextAlign.left,
                                  onSaved: controller.onEmailSaved,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onFieldSubmitted: (v) =>
                                      FocusScope.of(context).nextFocus(),
                                  decoration:
                                      AppDecorations.textFieldDecoration(
                                              context)
                                          .copyWith(
                                    hintText: "Phone",
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.visiblePassword,
                                    onFieldSubmitted: (v) =>
                                        FocusScope.of(context).nextFocus(),
                                    style: TextStyle(
                                        color: Get.theme.textSelectionTheme
                                            .cursorColor,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2),
                                    onSaved: controller.onPasswordSaved,
                                    obscureText: controller.isObscure.value,
                                    textAlignVertical: TextAlignVertical.center,
                                    validator: (val) {
                                      return AppFormValidators.validateEmpty(
                                          val);
                                    },
                                    // onChanged: (value) => {passWord = value},
                                    textAlign: TextAlign.left,
                                    decoration:
                                        AppDecorations.textFieldDecoration(
                                                context)
                                            .copyWith(
                                      hintText: "Password",
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: IconButton(
                                          icon: Icon(
                                            controller.isObscure.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.black12,
                                            size: 25.0,
                                          ),
                                          onPressed: controller.toggleObscure,
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Get.toNamed(ForgotPasswordPage.routeName);
                                    },
                                    child: const Text(
                                      "Forgot Password?   ",
                                      style: TextStyle(
                                          color: Color(0xffCE1C1C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            AppPrimaryButton(
                              onPressed: controller.loginEmailAddress,
                              key: controller.buttonKey,
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RegisterPage.routeName);
                                  },
                                  child: Text(
                                    'Register Now',
                                    style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 30.0, top: 30.0),
                                child: SizedBox(
                                  height: 110.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF6F6F7),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 18.0),
                                      child: Center(
                                        child: FlutterLogo(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            )));
  }
}
