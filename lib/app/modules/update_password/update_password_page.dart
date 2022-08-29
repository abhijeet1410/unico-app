 import 'package:flutter_template_3/app/modules/update_password/presentations/update_password_screen.dart';
import 'package:flutter/material.dart';

///
/// Created by Sisira Sahoo
/// On 04/08/22 10:42 AM
///

class UpdatePasswordPage extends StatefulWidget {
  static const routeName = '/updatePassword';
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {


  @override
  Widget build(BuildContext context) {
   return const UpdatePasswordScreen();
  }
}
