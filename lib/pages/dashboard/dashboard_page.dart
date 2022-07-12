import 'package:flutter/material.dart';
import 'package:flutter_template_3/configs/route_configs/app_routes.dart';
import 'package:flutter_template_3/pages/dashboard/widgets/side_menu.dart';
import 'package:flutter_template_3/pages/feedback/feedback_page.dart';
import 'package:flutter_template_3/pages/home/home_page.dart';
import 'package:flutter_template_3/pages/home_page.dart';
import 'package:flutter_template_3/pages/review/review_page.dart';
import 'package:flutter_template_3/pages/users/all_users/users_page.dart';
import 'package:flutter_template_3/pages/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/pages/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        final currentLocation = currentRoute?.location;
        print('CURRENT LOC $currentLocation');
        var currentIndex = 0;
        if (currentLocation?.startsWith(UsersPage.routeName) == true) {
          currentIndex = 1;
        }
        if (currentLocation?.startsWith(UnverifiedUsersPage.routeName) ==
            true) {
          currentIndex = 2;
        }
        if (currentLocation?.startsWith(BlockedUsersPage.routeName) == true) {
          currentIndex = 3;
        }
        if (currentLocation?.startsWith(FeedbackPage.routeName) == true) {
          currentIndex = 4;
        }
        if (currentLocation?.startsWith(ReviewPage.routeName) == true) {
          currentIndex = 5;
        }
        return Scaffold(
            appBar: AppBar(
              title: Text('Dashboard'),
            ),
            body: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SideMenu(
                          currentIndex: currentIndex,
                          onSelect: (value) => _onSelect(value, delegate))),
                  Expanded(
                    flex: 5,
                    child: GetRouterOutlet(
                      initialRoute: DashboardPage.routeName,
                      anchorRoute: HomePage.routeName,
                      key: Get.nestedKey(HomePage.routeName),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  _onSelect(value, GetDelegate delegate) {
    switch (value) {
      case 0:
        delegate.backUntil(DashboardPage.routeName);
        break;
      case 1:
        delegate.toNamed(UsersPage.routeName);
        break;
      case 2:
        delegate.toNamed(UnverifiedUsersPage.routeName);
        break;
      case 3:
        delegate.toNamed(BlockedUsersPage.routeName);
        break;
      case 4:
        delegate.toNamed(FeedbackPage.routeName);
        break;
      case 5:
        delegate.toNamed(ReviewPage.routeName);
        break;
      default:
    }
  }
}
