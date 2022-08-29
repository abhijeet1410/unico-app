import 'package:flutter_template_3/app/core/utils/decorations/app_decorations.dart';
import 'package:flutter_template_3/app/core/utils/validators/app_validators.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/register/presentation/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterController controller;
  @override
  void initState() {
    super.initState();
    controller = //Get.isRegistered<RegisterController>()
        // ?
        Get.find<RegisterController>();
    // : Get.put(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mainColor = Get.theme.primaryColor;
    final backGroundColor = Get.theme.backgroundColor;
    final cursorColor = Get.theme.textSelectionTheme.cursorColor;
    final textFromStyle =
        TextStyle(color: cursorColor, fontWeight: FontWeight.w600, height: 1.2);
    return Scaffold(
      body: Obx(
        () => Form(
          key: controller.formKey,
          autovalidateMode: controller.autoValidateMode.value,
          child: GestureDetector(
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
                                      splashColor:
                                          Colors.white.withOpacity(0.5),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
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
                              'Register Now',
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
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  children: <Widget>[
                    // SizedBox(
                    //   height: size.height / 6,
                    // ),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        textAlignVertical: TextAlignVertical.center,
                        textCapitalization: TextCapitalization.words,
                        onFieldSubmitted: (v) =>
                            FocusScope.of(context).nextFocus(),
                        cursorColor: cursorColor,
                        onSaved: controller.onNameSaved,
                        validator: (val) =>
                            AppFormValidators.validateEmpty(val, context),
                        textAlign: TextAlign.left,
                        style: textFromStyle,
                        keyboardType: TextInputType.name,
                        onChanged: (v) => controller.onNameSaved(v),
                        decoration: AppDecorations.textFieldDecoration(context)
                            .copyWith(
                          hintText: "Your name",
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.phoneController,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      onFieldSubmitted: (v) =>
                          FocusScope.of(context).nextFocus(),
                      cursorColor: cursorColor,
                      onSaved: controller.onPhoneSaved,
                      onChanged: controller.onPhoneSaved,
                      validator: (val) =>
                          AppFormValidators.validatePhone(val, context),
                      textAlign: TextAlign.left,
                      style: textFromStyle,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: AppDecorations.textFieldDecoration(context)
                          .copyWith(
                              hintText: "Phone",
                              errorText: controller.phoneError.value,
                              contentPadding:
                                  const EdgeInsets.only(right: 0, left: 20),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.sendPhoneOTP();
                                },
                                child: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                              right: Radius.circular(30))),
                                  child: const Center(
                                      child: Text(
                                    "Verify",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      onFieldSubmitted: (v) =>
                          FocusScope.of(context).nextFocus(),
                      cursorColor: cursorColor,
                      onSaved: controller.onOtpSaved,
                      onChanged: controller.onOtpSaved,
                      validator: (val) =>
                          AppFormValidators.validateEmpty(val, context),
                      textAlign: TextAlign.left,
                      style: textFromStyle,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration:
                          AppDecorations.textFieldDecoration(context).copyWith(
                        hintText: "OTP",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        obscureText: controller.isObscure.value,
                        textInputAction: TextInputAction.next,
                        textAlignVertical: TextAlignVertical.center,
                        onFieldSubmitted: (v) =>
                            FocusScope.of(context).nextFocus(),
                        cursorColor: cursorColor,
                        onSaved: controller.onNewPasswordSaved,
                        validator: (val) =>
                            AppFormValidators.validateEmpty(val, context),
                        textAlign: TextAlign.left,
                        style: textFromStyle,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (v) => controller.onNewPasswordSaved(v),
                        decoration: AppDecorations.textFieldDecoration(context)
                            .copyWith(
                                hintText: "Enter new password",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
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
                                ))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (v) =>
                            FocusScope.of(context).nextFocus(),
                        style: textFromStyle,
                        obscureText: controller.isObscure1.value,
                        textAlignVertical: TextAlignVertical.center,
                        validator: (val) {
                          return controller.confirmPasswordValidator(
                              val, context);
                        },
                        textAlign: TextAlign.left,
                        cursorColor: cursorColor,
                        onSaved: controller.onConfirmPasswordSaved,
                        onChanged: (v) => controller.onConfirmPasswordSaved(v),
                        decoration: AppDecorations.textFieldDecoration(context)
                            .copyWith(
                          hintText: "Confirm new password",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
                              icon: Icon(
                                controller.isObscure1.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black12,
                                size: 25.0,
                              ),
                              onPressed: controller.toggleObscure1,
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    RadioListTile(
                      toggleable: true,
                      value: 1,
                      contentPadding: EdgeInsets.zero,
                      groupValue: controller.referral.value,
                      onChanged: controller.updateReferral,
                      title: const Text("I have a referral code"),
                    ),
                    const SizedBox(height: 20),
                    if (controller.referral.value == 1) ...[
                      TextFormField(
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          onFieldSubmitted: (v) =>
                              FocusScope.of(context).nextFocus(),
                          cursorColor: cursorColor,
                          onSaved: controller.onReferralCodeSaved,
                          validator: (val) =>
                              AppFormValidators.validateEmpty(val, context),
                          textAlign: TextAlign.left,
                          style: textFromStyle,
                          keyboardType: TextInputType.name,
                          onChanged: (v) => controller.onReferralCodeSaved(v),
                          decoration:
                              AppDecorations.textFieldDecoration(context)
                                  .copyWith(
                            hintText: "Referral code",
                          )),
                      const SizedBox(height: 30)
                    ],
                    AppPrimaryButton(
                        key: controller.buttonKey,
                        onPressed: controller.register,
                        child: const Text("SAVE")),
                    const SizedBox(height: 20),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
