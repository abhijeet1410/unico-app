import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/pages/dashboard/dashboard_page.dart';
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
    return GetRouterOutlet.builder(
      builder: (context, rDelegate, currentRoute) {
        final title = currentRoute?.location;
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: DashboardPage.routeName,
            // emptyPage: (delegate) =>
            //     Get.routeTree.matchRoute(DashboardPage.routeName).route!,
            // pickPages: (currentNavStack) {
            //   return currentNavStack.currentTreeBranch.skip(1).take(1).toList();
            // },
          ),
        );
      },
    );
  }
}
