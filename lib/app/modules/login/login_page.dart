import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/app_decorations.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:get/get.dart';

import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _loginController;
  @override
  void initState() {
    super.initState();
    _loginController = LoginController();
    _loginController.onInit();
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Form(
              key: _loginController.formKey,
              autovalidateMode: _loginController.autoValidateMode.value,
              child: Center(
                  child: SimpleDialog(
                      title: Center(child: Text('Login')),
                      contentPadding: const EdgeInsets.all(22),
                      children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: _loginController.onEmailSaved,
                      onFieldSubmitted: (s) =>
                          FocusScope.of(context).nextFocus(),
                      validator: (value) =>
                          _loginController.emailValidator(value, context),
                      decoration:
                          AppDecorations.textFieldDecoration(context).copyWith(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Icon(Icons.email),
                        ),
                        labelText: 'Email-ID',
                        hintText: 'abc@gmail.com',
                      ),
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      obscureText: _loginController.isObscure.value,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (v) =>
                          _loginController.loginEmailAddress,
                      onSaved: _loginController.onPasswordSaved,
                      validator: _loginController.passwordValidator,
                      decoration:
                          AppDecorations.textFieldDecoration(context).copyWith(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Icon(Icons.lock),
                              ),
                              labelText: 'Password',
                              hintText: '********',
                              suffixIcon: GestureDetector(
                                onTap: _loginController.toggleObscure,
                                child: Icon(_loginController.isObscure.value
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded),
                              )),
                    ),
                    SizedBox(height: 22),
                    AppPrimaryButton(
                      child: Text('Login'),
                      onPressed: _loginController.loginEmailAddress,
                      key: _loginController.buttonKey,
                    ),
                    SizedBox(height: 14),
                  ])),
            )));
  }
}
