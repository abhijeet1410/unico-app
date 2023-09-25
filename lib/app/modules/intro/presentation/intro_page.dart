import 'package:flutter/foundation.dart';
import 'package:flutter_template_3/app/core/base/base_page.dart';
import 'package:flutter_template_3/app/core/pages/intro/models/intro_options.dart';
import 'package:flutter_template_3/app/core/pages/intro/presentation/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class IntroPage extends BasePage {
  const IntroPage({Key? key}) : super(key: key);

  static String get routeName => "/intro";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends BasePageState<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return AppIntroPage(
        titleLogo: const Padding(
          padding: EdgeInsets.all(8.0),
          child: FlutterLogo(size: 40),
        ),
        titleAction: TextButton(
          child: const Text("Skip"),
          onPressed: () {
            NavigationHelper.offAllNamed(DashboardPage.routeName);
          },
        ),
        incompleteButtonLabel: "Next",
        completedButtonLabel: "Proceed",
        introData: [
          AppIntroSliderData(
              asset: Image.network(
                "https://img.freepik.com/free-vector/cartoon-funny-cat-art-isolated-white_191095-342.jpg?size=626&ext=jpg&ga=GA1.1.1384781813.1685017232&semt=sph",
              ),
              title: "Meow",
              description:
                  "Meow meow meow meow meow meow meow meow meow meow meow meow meow"),
          AppIntroSliderData(
              asset: Image.network(
                  "https://img.freepik.com/free-vector/cheerful-cute-dog-white-background_1308-132745.jpg?size=626&ext=jpg&ga=GA1.1.1384781813.1685017232&semt=sph"),
              title: "Bhou",
              description:
                  "Bhou bhou bhou bhou bhou bhou bhou bhou bhou bhou bhou bhou bhou "),
          AppIntroSliderData(
              asset: Image.network(
                  "https://img.freepik.com/free-vector/cute-cow-with-big-smile-white_1308-41190.jpg?size=626&ext=jpg&ga=GA1.1.1384781813.1685017232&semt=sph"),
              title: "Moo",
              description:
                  "Moo moo moo moo moo moo moo moo moo moo moo moo moo moo moo moo "),
        ],
        onPageChange: (i) {
          print("ON PAGE CHANGE $i");
          if (i == 3) {
            Get.offAllNamed(DashboardPage.routeName);
          }

          ///on scroll finished
        });
  }
}
