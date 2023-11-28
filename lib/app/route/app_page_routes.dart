import 'package:flutter_template_3/app/core/middlewares/auth_check_middleware.dart';
import 'package:flutter_template_3/app/modules/feedback/feedback_page.dart';
import 'package:flutter_template_3/app/modules/forgot_password/forgot_password_page.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/intro/presentation/intro_page.dart';
import 'package:flutter_template_3/app/modules/items/presentation/add_item_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/register/presentation/register_page.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/splash_page.dart';
import 'package:flutter_template_3/app/modules/update_password/update_password_page.dart';
import 'package:flutter_template_3/app/modules/users/all_users/users_page.dart';
import 'package:flutter_template_3/app/modules/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/app/modules/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';

import 'package:flutter_template_3/app/modules/orders/presentation/orders_page.dart';
import 'package:flutter_template_3/app/modules/slots/presentation/slots_page.dart';
import 'package:flutter_template_3/app/modules/items/presentation/items_page.dart';
import 'package:flutter_template_3/app/modules/forgot_password_otp/forgot_password_otp_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPageRoutes {
  static final List<String> noAuthPages = <String>[
    LoginPage.routeName,
    ForgotPasswordPage.routeName,
    ForgotPasswordOtpPage.routeName,
    UpdatePasswordPage.routeName,
    RegisterPage.routeName,
  ];
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
        name: SplashPage.routeName,
        page: () => const SplashPage(),
        participatesInRootNavigator: true,
        middlewares: [
          // AuthCheckMiddleware(),
        ],
        children: [
          GetPage<dynamic>(
            name: IntroPage.routeName,
            participatesInRootNavigator: false,
            page: () => const IntroPage(),
          ),
          GetPage<dynamic>(
            name: LoginPage.routeName,
            participatesInRootNavigator: false,
            middlewares: <GetMiddleware>[NoAuthCheckMiddleware()],
            page: () => const LoginPage(),
          ),
          GetPage<dynamic>(
            name: ForgotPasswordPage.routeName,
            page: () => const ForgotPasswordPage(),
            participatesInRootNavigator: false,
            preventDuplicates: true,
          ),
          GetPage<dynamic>(
            name: ForgotPasswordOtpPage.routeName,
            page: () => const ForgotPasswordOtpPage(),
            participatesInRootNavigator: false,
            preventDuplicates: true,
          ),
          GetPage<dynamic>(
            name: UpdatePasswordPage.routeName,
            page: () => const UpdatePasswordPage(),
            participatesInRootNavigator: false,
            preventDuplicates: true,
          ),
          GetPage<dynamic>(
            name: RegisterPage.routeName,
            page: () => const RegisterPage(),
            participatesInRootNavigator: false,
            preventDuplicates: true,
          ),
          GetPage<dynamic>(
            name: DashboardPage.routeName,
            title: 'Dashboard',
            participatesInRootNavigator: false,
            page: () => const DashboardPage(),
          ),
          GetPage<dynamic>(
              name: UsersPage.routeName,
              title: 'Users',
              participatesInRootNavigator: false,
              page: () => UsersPage()),
          GetPage<dynamic>(
              name: UnverifiedUsersPage.routeName,
              title: 'Unverified Users',
              participatesInRootNavigator: false,
              page: () => UnverifiedUsersPage()),
          GetPage<dynamic>(
              name: BlockedUsersPage.routeName,
              title: 'BlockedUsersPage Users',
              participatesInRootNavigator: false,
              page: () => BlockedUsersPage()),
          GetPage<dynamic>(
              name: FeedbackPage.routeName,
              title: 'Feedback',
              participatesInRootNavigator: false,
              page: () => FeedbackPage()),
        ]),
    GetPage<dynamic>(
      name: OrdersPage.routeName,
      title: 'OrdersPage',
      page: () => const OrdersPage(),
      participatesInRootNavigator: false,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
      name: SlotsPage.routeName,
      title: 'SlotsPage',
      page: () => const SlotsPage(),
      participatesInRootNavigator: false,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
      name: ItemsPage.routeName,
      title: 'ItemsPage',
      page: () => const ItemsPage(),
      participatesInRootNavigator: false,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
    GetPage<dynamic>(
      name: AddItemsPage.routeName,
      title: 'AddItemsPage',
      page: () => const AddItemsPage(),
      participatesInRootNavigator: false,
      preventDuplicates: true,
      transition: Transition.noTransition,
    ),
  ];
}
