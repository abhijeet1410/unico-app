import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // if (SharedPreferenceHelper.accessToken == null)
      //   Get.offAndToNamed(LoginPage.routeName);
      // else
      Future.delayed(Duration(seconds: 3)).then((value) {
        Get.offAndToNamed(DashboardPage.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
