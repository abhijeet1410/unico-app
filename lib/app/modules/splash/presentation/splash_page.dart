import 'package:flutter_template_3/app/core/base/base_page.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/screen/splash_screen.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

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
