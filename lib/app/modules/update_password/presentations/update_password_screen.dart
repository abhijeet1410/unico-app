import 'package:flutter_template_3/app/core/utils/decorations/app_decorations.dart';
import 'package:flutter_template_3/app/core/utils/validators/app_validators.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/update_password/presentations/controller/update_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class UpdatePasswordScreen extends GetView<UpdatePasswordController> {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                              'Set a new password',
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
                    SizedBox(
                      height: size.height / 6,
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
                      height: 70,
                    ),
                    AppPrimaryButton(
                        key: controller.buttonKey,
                        onPressed: controller.resetPassword,
                        child: Text("Save Password".toUpperCase())),
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
