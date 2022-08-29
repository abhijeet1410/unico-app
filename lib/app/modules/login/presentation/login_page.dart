import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/login_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/screen/login_screen.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
