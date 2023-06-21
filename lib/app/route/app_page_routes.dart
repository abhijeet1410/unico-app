import 'package:flutter_template_3/app/core/middlewares/auth_check_middleware.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/feedback/feedback_page.dart';
import 'package:flutter_template_3/app/modules/forgot_password/forgot_password_page.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/intro/presentation/intro_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/register/presentation/register_page.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/splash_page.dart';
import 'package:flutter_template_3/app/modules/update_password/update_password_page.dart';
import 'package:flutter_template_3/app/modules/users/all_users/users_page.dart';
import 'package:flutter_template_3/app/modules/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/app/modules/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';

import 'package:flutter_template_3/app/modules/forgot_password_otp/forgot_password_otp_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPageRoutes {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: SplashPage.routeName,
      page: () => const SplashPage(),
    ), GetPage<dynamic>(
      name: IntroPage.routeName,
      page: () => const IntroPage(),
    ),
    GetPage<dynamic>(
      name: LoginPage.routeName,
      middlewares: <GetMiddleware>[NoAuthCheckMiddleware()],
      page: () => const LoginPage(),
    ),
    GetPage<dynamic>(
      name: LoginPage.routeName,
      page: () => const LoginPage(),
      // middlewares: [NoAuthCheckMiddleware()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
      name: ForgotPasswordPage.routeName,
      page: () => const ForgotPasswordPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
      name: ForgotPasswordOtpPage.routeName,
      page: () => const ForgotPasswordOtpPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
      name: UpdatePasswordPage.routeName,
      page: () => const UpdatePasswordPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
      name: RegisterPage.routeName,
      page: () => const RegisterPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
        name: DashboardPage.routeName,
        participatesInRootNavigator: true,
        preventDuplicates: true,
        transition: Transition.noTransition,
        middlewares: <GetMiddleware>[
          AuthCheckMiddleware(),
        ],
        page: () => DashboardPage(),
        title: null,
        children: <GetPage<dynamic>>[
          GetPage<dynamic>(
            name: HomePage.routeName,
            title: 'Dashboard',
            page: () => const HomePage(),
            transition: Transition.noTransition,
          ),
          GetPage<dynamic>(
              name: UsersPage.routeName,
              title: 'Users',
              transition: Transition.noTransition,
              page: () => UsersPage()),
          GetPage<dynamic>(
              name: UnverifiedUsersPage.routeName,
              title: 'Unverified Users',
              transition: Transition.noTransition,
              page: () => UnverifiedUsersPage()),
          GetPage<dynamic>(
              name: BlockedUsersPage.routeName,
              transition: Transition.noTransition,
              title: 'BlockedUsersPage Users',
              page: () => BlockedUsersPage()),
          GetPage<dynamic>(
              name: FeedbackPage.routeName,
              title: 'Feedback',
              transition: Transition.noTransition,
              page: () => FeedbackPage()),
        ])
  ];
}
