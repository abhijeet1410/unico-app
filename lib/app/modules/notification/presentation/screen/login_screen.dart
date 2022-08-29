import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/decorations/app_decorations.dart';
import 'package:flutter_template_3/app/core/utils/validators/app_validators.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/login_controller.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:14 PM
///
class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Form(
        key: controller.formKey,
        autovalidateMode: controller.autoValidateMode.value,
        child: Center(
            child: SimpleDialog(
                title: const Center(child: Text('Login')),
                contentPadding: const EdgeInsets.all(22),
                children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onSaved: controller.onEmailSaved,
                onFieldSubmitted: (s) => FocusScope.of(context).nextFocus(),
                validator: (value) =>
                    AppFormValidators.validateMail(value, context),
                decoration:
                    AppDecorations.textFieldDecoration(context).copyWith(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Icon(Icons.email),
                  ),
                  labelText: 'Email-ID',
                  hintText: 'abc@gmail.com',
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                obscureText: controller.isObscure.value,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (v) => controller.loginEmailAddress,
                onSaved: controller.onPasswordSaved,
                validator: AppFormValidators.validateEmpty,
                decoration:
                    AppDecorations.textFieldDecoration(context).copyWith(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Icon(Icons.lock),
                        ),
                        labelText: 'Password',
                        hintText: '********',
                        suffixIcon: GestureDetector(
                          onTap: controller.toggleObscure,
                          child: Icon(controller.isObscure.value
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded),
                        )),
              ),
              const SizedBox(height: 22),
              AppPrimaryButton(
                onPressed: controller.loginEmailAddress,
                key: controller.buttonKey,
                child: const Text('Login'),
              ),
              const SizedBox(height: 14),
            ])),
      ),
    ));
  }
}
