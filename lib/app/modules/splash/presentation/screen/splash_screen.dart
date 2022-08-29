import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/base/base_view.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class SplashScreen extends BaseView {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
