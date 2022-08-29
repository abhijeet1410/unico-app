import 'package:flutter_template_3/app/modules/forgot_password/presentation/forgot_password_screen.dart';
import 'package:flutter/material.dart';

///
/// Created by Sisira Sahoo
/// On 03/08/22 11:02 AM
///

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/forgot';
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordScreen();
  }
}
