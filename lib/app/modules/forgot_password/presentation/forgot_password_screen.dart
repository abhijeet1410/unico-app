import 'package:flutter_template_3/app/core/utils/decorations/app_decorations.dart';
import 'package:flutter_template_3/app/core/utils/validators/app_validators.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/forgot_password/presentation/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mainColor = Get.theme.primaryColor;
    final backGroundColor = Get.theme.backgroundColor;
    final textFromStyle = TextStyle(
        color: Get.theme.textSelectionTheme.cursorColor,
        fontWeight: FontWeight.w600,
        height: 1.2);
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
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  children: <Widget>[
                    SizedBox(
                      height: size.height / 6,
                    ),
                    TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        onSaved: controller.onPhoneSaved,
                        validator: (val) =>
                            AppFormValidators.validatePhone(val, context),
                        textAlign: TextAlign.left,
                        style: textFromStyle,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: AppDecorations.textFieldDecoration(context)
                            .copyWith(hintText: "Your mobile number")),
                    SizedBox(
                      height: size.height / 3 + 20,
                    ),
                    Text('This code will expire on 5 minutes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: mainColor,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppPrimaryButton(
            key: controller.buttonKey,
            onPressed: controller.forgot,
            child: const Text("Submit")),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
