import 'package:flutter_template_3/pages/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/pages/feedback/feedback_page.dart';
import 'package:flutter_template_3/pages/home_page.dart';
import 'package:flutter_template_3/pages/review/review_page.dart';
import 'package:flutter_template_3/pages/users/all_users/users_page.dart';
import 'package:flutter_template_3/pages/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/pages/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';

import 'router_middleware.dart';

///
/// Created by Sunil Kumar
/// On 11-07-2022 02:50 PM
///
class AppPageRoutes {
  static final routes = [
    GetPage(
        name: DashboardPage.routeName,
        preventDuplicates: true,
        participatesInRootNavigator: true,
        // middlewares: [
        //   RouterOutletContainerMiddleWare('/'),
        // ],
        page: () => DashboardPage(),
        title: null,
        children: [
          GetPage(
              name: HomePage.routeName,
              title: 'Dashboard',
              page: () => const HomePage()),
          GetPage(
              name: UsersPage.routeName,
              title: 'Users',
              page: () => UsersPage()),
          GetPage(
              name: UnverifiedUsersPage.routeName,
              title: 'Unverified Users',
              page: () => UnverifiedUsersPage()),
          GetPage(
              name: BlockedUsersPage.routeName,
              title: 'BlockedUsersPage Users',
              page: () => BlockedUsersPage()),
          GetPage(
              name: FeedbackPage.routeName,
              title: 'Feedback',
              page: () => FeedbackPage()),
          GetPage(
              name: ReviewPage.routeName,
              title: 'Review',
              page: () => ReviewPage()),
        ]),
  ];
}
