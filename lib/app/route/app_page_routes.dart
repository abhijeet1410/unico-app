import 'package:flutter_template_3/app/core/middlewares/auth_check_middleware.dart';
import 'package:flutter_template_3/app/modules/cart/presentation/cart_page.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/intro/presentation/intro_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/product/presentation/product_page.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/splash_page.dart';
import 'package:flutter_template_3/app/modules/users/all_users/users_page.dart';
import 'package:flutter_template_3/app/modules/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/app/modules/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';
import '../modules/checkout/presentation/checkout_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPageRoutes {
  static final List<String> noAuthPages = <String>[
    LoginPage.routeName,
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
            name: DashboardPage.routeName,
            title: 'Dashboard',
            participatesInRootNavigator: false,
            page: () => const DashboardPage(),
          ),
          GetPage<dynamic>(
            name: ProductPage.routeName,
            title: 'Product',
            participatesInRootNavigator: false,
            page: () => const ProductPage(),
          ),
          GetPage<dynamic>(
            name: CartPage.routeName,
            title: 'CartPage',
            participatesInRootNavigator: false,
            page: () => const CartPage(),
          ),
          GetPage<dynamic>(
            name: CheckoutPage.routeName,
            title: 'CheckoutPage',
            participatesInRootNavigator: false,
            page: () => const CheckoutPage(),
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
        ]),
  ];
}
