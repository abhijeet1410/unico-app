import 'package:flutter/material.dart';
import 'package:unico_app/app/core/base/base_page.dart';
import 'package:unico_app/app/modules/login/presentation/controller/login_controller.dart';
import 'package:unico_app/app/modules/login/presentation/screen/login_screen.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class LoginPage extends BasePage {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BasePageState<LoginPage> {
  final loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
