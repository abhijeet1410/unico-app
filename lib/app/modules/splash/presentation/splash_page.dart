import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/base/base_page.dart';
import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/screen/splash_screen.dart';
import 'package:get/get.dart';

class SplashPage extends BasePage {
  const SplashPage({Key? key}) : super(key: key);
  static String get routeName => "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage> {
  final controller = Get.find<SplashController>();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.checkUserLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
