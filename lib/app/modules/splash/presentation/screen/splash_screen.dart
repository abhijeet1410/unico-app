import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_template_3/app/core/base/base_view.dart';

///
/// Created by Sunil Kumar
/// On 29-08-2022 02:22 PM
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
