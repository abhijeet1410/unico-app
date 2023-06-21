import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/base/base_page.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source.dart';
import 'package:flutter_template_3/app/core/models/device_info_req_model.dart';
import 'package:flutter_template_3/app/core/pages/intro/models/intro_options.dart';
import 'package:flutter_template_3/app/core/pages/intro/presentation/intro_page.dart';
import 'package:flutter_template_3/app/core/pages/splash/models/splash_options.dart';
import 'package:flutter_template_3/app/core/pages/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification.dart';
import 'package:flutter_template_3/app/core/widgets/alerts/alert_dialog.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:flutter_template_3/app/modules/splash/domain/usecases/splash_refresh_token_usecase.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onPressed: () {},
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
        });
  }
}
