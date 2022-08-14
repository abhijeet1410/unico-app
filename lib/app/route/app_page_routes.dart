import 'package:flutter_template_3/app/core/middlewares/auth_check_middleware.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/feedback/feedback_page.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/onboarding/presentation/onboarding_page.dart';
import 'package:flutter_template_3/app/modules/review/review_page.dart';
import 'package:flutter_template_3/app/modules/splash/splash_page.dart';
import 'package:flutter_template_3/app/modules/users/all_users/users_page.dart';
import 'package:flutter_template_3/app/modules/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/app/modules/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPageRoutes {
  static final routes = [
    GetPage(
      name: SplashPage.routeName,
      page: () => SplashPage(),
    ),
    GetPage(
      name: LoginPage.routeName,
      middlewares: [NoAuthCheckMiddleware()],
      page: () => const LoginPage(),
    ),
    GetPage(
      name: OnBoardingPage.routeName,
      page: () => const OnBoardingPage(),
    ),
    GetPage(
        name: DashboardPage.routeName,
        participatesInRootNavigator: true,
        preventDuplicates: true,
        transition: Transition.noTransition,
        middlewares: [
          AuthCheckMiddleware(),
        ],
        page: () => DashboardPage(),
        title: null,
        children: [
          GetPage(
            name: HomePage.routeName,
            title: 'Dashboard',
            page: () => const HomePage(),
            transition: Transition.noTransition,
          ),
          GetPage(
              name: UsersPage.routeName,
              title: 'Users',
              transition: Transition.noTransition,
              page: () => UsersPage()),
          GetPage(
              name: UnverifiedUsersPage.routeName,
              title: 'Unverified Users',
              transition: Transition.noTransition,
              page: () => UnverifiedUsersPage()),
          GetPage(
              name: BlockedUsersPage.routeName,
              transition: Transition.noTransition,
              title: 'BlockedUsersPage Users',
              page: () => BlockedUsersPage()),
          GetPage(
              name: FeedbackPage.routeName,
              title: 'Feedback',
              transition: Transition.noTransition,
              page: () => FeedbackPage()),
          GetPage(
              name: ReviewPage.routeName,
              title: 'Review',
              transition: Transition.noTransition,
              page: () => ReviewPage()),
        ])
  ];
}
