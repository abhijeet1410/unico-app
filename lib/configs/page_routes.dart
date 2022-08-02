import 'package:flutter_template_3/pages/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/pages/feedback/feedback_page.dart';
import 'package:flutter_template_3/pages/home/binding/home_binding.dart';
import 'package:flutter_template_3/pages/home/home_page.dart';
import 'package:flutter_template_3/pages/review/review_page.dart';
import 'package:flutter_template_3/pages/splash/splash_page.dart';
import 'package:flutter_template_3/pages/users/all_users/users_page.dart';
import 'package:flutter_template_3/pages/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/pages/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPageRoutes {
  static final routes = [
    GetPage(
        name: SplashPage.routeName,
        page: () => SplashPage(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: []),
    GetPage(
        name: DashboardPage.routeName,
        participatesInRootNavigator: true,
        preventDuplicates: true,
        transition: Transition.noTransition,
        middlewares: [
          // RouterOutletContainerMiddleWare('/'),
        ],
        page: () => DashboardPage(),
        title: null,
        children: [
          GetPage(
            name: HomePage.routeName,
            title: 'Dashboard',
            page: () => const HomePage(),
            binding: HomeBinding(),
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
          // GetPage(
          //     name: UnverifiedUsersPage.routeName,
          //     page: () => UnverifiedUsersPage()),
          // GetPage(
          //     name: BlockedUsersPage.routeName,
          //     page: () => BlockedUsersPage()),
          // GetPage(name: FeedBacksPage.routeName, page: () => FeedBacksPage()),
          // GetPage(name: ReviewsPage.routeName, page: () => ReviewsPage()),
          // GetPage(
          //     name: AllTransactionsPage.routeName,
          //     page: () => AllTransactionsPage()),
          // GetPage(
          //     name: PendingTransactionPage.routeName,
          //     page: () => PendingTransactionPage()),
        ])
    // GetPage(name: SplashPage.routeName, page: () => SplashPage(), middlewares: [
    //   RouterOutletContainerMiddleWare('/'),
    // ], children: [
    //   // GetPage(name: LoginPage.routeName, page: () => LoginPage()),
    //   // GetPage(name: UserProfilePage.routeName, page: () => UserProfilePage()),
    //   GetPage(
    //       name: DashboardPage.routeName,
    //       preventDuplicates: true,
    //       page: () => DashboardPage(),
    //       title: null,
    //       children: [
    //         GetPage(
    //             name: HomePage.routeName,
    //             title: 'Dashboard',
    //             page: () => HomePage()),
    //         GetPage(
    //             name: UsersPage.routeName,
    //             title: 'Users',
    //             page: () => UsersPage()),
    //         GetPage(
    //             name: FeedbackPage.routeName,
    //             title: 'Feedback',
    //             page: () => FeedbackPage()),
    //         GetPage(
    //             name: ReviewPage.routeName,
    //             title: 'Review',
    //             page: () => ReviewPage()),
    //         // GetPage(
    //         //     name: UnverifiedUsersPage.routeName,
    //         //     page: () => UnverifiedUsersPage()),
    //         // GetPage(
    //         //     name: BlockedUsersPage.routeName,
    //         //     page: () => BlockedUsersPage()),
    //         // GetPage(name: FeedBacksPage.routeName, page: () => FeedBacksPage()),
    //         // GetPage(name: ReviewsPage.routeName, page: () => ReviewsPage()),
    //         // GetPage(
    //         //     name: AllTransactionsPage.routeName,
    //         //     page: () => AllTransactionsPage()),
    //         // GetPage(
    //         //     name: PendingTransactionPage.routeName,
    //         //     page: () => PendingTransactionPage()),
    //       ]),
    // ]),
  ];
}
