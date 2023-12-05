import 'package:flutter_svg/flutter_svg.dart';
import 'package:unico_app/app/core/theme/app_colors.dart';
import 'package:unico_app/app/modules/home/presentation/home_page.dart';
import 'package:unico_app/app/modules/login/presentation/login_page.dart';
import 'package:unico_app/app/modules/splash/presentation/screen/splash_screen.dart';
import 'package:unico_app/app/modules/splash/presentation/widgets/side_menu.dart';
import 'package:unico_app/app/route/app_page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unico_app/app/modules/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AdminSplashScreen extends SplashScreen {
  AdminSplashScreen({super.key});

  @override
  Widget? body(BuildContext context) {
    return GetRouterOutlet(
      anchorRoute: SplashPage.routeName,
      initialRoute: LoginPage.routeName,
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
    return SizedBox();
  }

  @override
  Widget? mobileBottomNav(
      BuildContext context, String currentLocation, GetDelegate delegate) {
    return SizedBox.shrink();
    // if (currentLocation == "/" ||
    //     drawerData.map((e) => e.path).contains(currentLocation)) {
    //   return Container(
    //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
    //       BoxShadow(
    //           color: Colors.black12,
    //           offset: Offset(0, -1),
    //           spreadRadius: 2,
    //           blurRadius: 2),
    //     ]),
    //     child: DefaultTabController(
    //       length: drawerData.length,
    //       initialIndex: drawerData.indexWhere(
    //                   (element) => element.path == currentLocation) ==
    //               -1
    //           ? 0
    //           : drawerData
    //               .indexWhere((element) => element.path == currentLocation),
    //       child: TabBar(
    //           labelPadding: EdgeInsets.zero,
    //           onTap: (i) {
    //             delegate.toNamed(drawerData[i].path);
    //           },
    //           indicatorPadding: EdgeInsets.zero,
    //           padding: EdgeInsets.zero,
    //           indicator: const BoxDecoration(
    //               border: Border(
    //                   top: BorderSide(
    //             width: 2,
    //             color: AppColors.brightPrimary,
    //           ))),
    //           labelColor: AppColors.brightPrimary,
    //           unselectedLabelColor: const Color(0xFFD0D0D0),
    //           tabs: drawerData.map((e) {
    //             final selected = currentLocation.contains(e.path);
    //             final iconColor = selected == true
    //                 ? AppColors.brightPrimary.shade500
    //                 : const Color(0xFFD0D0D0);
    //             return Tab(
    //               icon: e.icon != null
    //                   ? SvgPicture.asset(
    //                       e.icon!,
    //                       colorFilter:
    //                           ColorFilter.mode(iconColor, BlendMode.srcIn),
    //                     )
    //                   : null,
    //               height: 60,
    //               iconMargin: EdgeInsets.zero,
    //               text: e.title,
    //             );
    //           }).toList()),
    //     ),
    //   );
    //   // return Container(
    //   //   height: kBottomNavigationBarHeight,
    //   //   color: Colors.white,
    //   //   child: Row(
    //   //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   //     children: drawerData
    //   //         .map((e) => EngineerSideMenuItem(
    //   //               title: e.title,
    //   //               icon: e.icon!,
    //   //               press: () {
    //   //                 delegate.toNamed(e.path);
    //   //               },
    //   //               selected: (drawerData.indexOf(e) == 0 &&
    //   //                       currentLocation == "/") ||
    //   //                   currentLocation.contains(e.path),
    //   //             ))
    //   //         .toList(),
    //   //   ),
    //   // );
    // }
    // return null;
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
