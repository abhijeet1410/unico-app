import 'package:flutter_template_3/app/core/theme/app_colors.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/widgets/side_menu.dart';
import 'package:get/get.dart';

import 'package:flutter_template_3/app/core/widgets/responsive.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class SplashScreen extends StatelessWidget {
  // @override
  // void initState() {
  //   super.initState();
  //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
  //     final PreferenceManager preferenceManager = Get.find<PreferenceManager>();
  //     final userController = Get.isRegistered<UserController>()
  //         ? Get.find<UserController>()
  //         : Get.put<UserController>(UserController(), permanent: true);
  //     final token = preferenceManager.accessToken;
  //     try {
  //       if (token != null) {
  //         RefreshTokenRequestModel refreshTokenRequestModel =
  //         RefreshTokenRequestModel(
  //           entity: "school",
  //           strategy: "jwt",
  //           deviceType: 1,
  //           deviceId: "12345",
  //         );
  //         final UserResponse res = await Get.put(
  //           SplashRefreshTokenUseCase(
  //             Get.put(
  //               RemoteSplashRepositoryImpl(
  //                 Get.put(
  //                   SplashDataSourceImpl(),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ).call(refreshTokenRequestModel);
  //         preferenceManager.storeAccessToken(res.accessToken!);
  //         userController.updateUser(res.user);
  //         NavigationHelper.offNamed(DashboardPage.routeName);
  //       } else {
  //         NavigationHelper.offNamed(LoginPage.routeName);
  //       }
  //     } catch (e, s) {
  //       log("Refresh Token Error $e", stackTrace: s, error: e);
  //       NavigationHelper.offNamed(LoginPage.routeName);
  //     }
  //   });
  // }

  SplashScreen({super.key});
  final User? currentUser = Get.find<UserController>().state;
  final RxInt bottomNavIndex = RxInt(0);

  final List<String> noAuthPages = <String>[];

  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.rootDelegate,
      builder: (BuildContext context, GetDelegate delegate,
          GetNavConfig? currentRoute) {
        final String currentLocation = currentRoute?.currentPage?.name ?? '';
        for (DrawerEntry element in drawerData) {
          if (currentLocation.startsWith(element.path) == true) {
            bottomNavIndex.value = element.index;
          }
        }
        final Widget? mobileBar = noAuthPages.contains(currentLocation)
            ? null
            : Responsive.isMobile(context)
                ? mobileDrawer(context, currentLocation, delegate)
                : null;
        final Widget? bottomNav = noAuthPages.contains(currentLocation)
            ? null
            : Responsive.isMobile(context)
                ? mobileBottomNav(context, currentLocation, delegate)
                : null;
        final Widget? webBar = noAuthPages.contains(currentLocation)
            ? const SizedBox()
            : !Responsive.isMobile(context)
                ? webDrawer(context, currentLocation, delegate)
                : const SizedBox();
        final Widget? topAppBar = noAuthPages.contains(currentLocation)
            ? const SizedBox()
            : topBar(context, currentLocation, delegate);
        return Scaffold(
          drawer: mobileBar,
          backgroundColor: backgroundColor,
          bottomNavigationBar: bottomNav,
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (webBar != null) webBar,
                if (body(context) != null)
                  Expanded(
                    child: Column(
                      children: [
                        if (topAppBar != null) topAppBar,
                        Expanded(
                          child: body(context) ?? const SizedBox(),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void onSelect(DrawerEntry entry, GetDelegate delegate) {
  //   delegate.toNamed(entry.path);
  // }

  Widget? body(BuildContext context);
  Widget? mobileDrawer(
      BuildContext context, String currentLocation, GetDelegate delegate);
  Widget? webDrawer(
      BuildContext context, String currentLocation, GetDelegate delegate);
  Widget? mobileBottomNav(
      BuildContext context, String currentLocation, GetDelegate delegate) {
    return null;
  }

  Widget? topBar(
      BuildContext context, String currentLocation, GetDelegate delegate) {
    return null;
  }
}
