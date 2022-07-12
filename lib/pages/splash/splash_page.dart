import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/pages/home_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      // if (SharedPreferenceHelper.accessToken == null)
      //   Get.offAndToNamed(LoginPage.routeName);
      // else

      // Get.offAndToNamed(DashboardPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RouterOutlet<GetDelegate, Object>.builder(
      builder: (context, key, obj) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: HomePage.routeName,
            // delegate: Get.nestedKey(null),
            anchorRoute: '/',
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}
