import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/screen/splash_screen.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/widgets/side_menu.dart';
import 'package:flutter_template_3/app/route/app_page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/modules/forgot_password/forgot_password_page.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/forgot_password_otp_page.dart';
import 'package:flutter_template_3/app/modules/register/presentation/register_page.dart';
import 'package:flutter_template_3/app/modules/update_password/update_password_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AdminSplashScreen extends SplashScreen {
  AdminSplashScreen({super.key});

  @override
  Widget? body(BuildContext context) {
    return GetRouterOutlet(
      anchorRoute: SplashPage.routeName,
      initialRoute: DashboardPage.routeName,
      filterPages: (Iterable<GetPage> afterAnchor) {
        return afterAnchor.take(1);
      },
    );
  }

  @override
  List<String> get noAuthPages => AppPageRoutes.noAuthPages;

  @override
  Widget? mobileDrawer(
      BuildContext context, String currentLocation, GetDelegate delegate) {
    return SideMenu(
        currentLocation: currentLocation,
        onSelect: (DrawerEntry value) {
          delegate.toNamed(value.path);
        });
  }

  @override
  Widget? webDrawer(
      BuildContext context, String currentLocation, GetDelegate delegate) {
    return SideMenu(
        currentLocation: currentLocation,
        onSelect: (DrawerEntry value) {
          delegate.toNamed(value.path);
        });
  }
}
