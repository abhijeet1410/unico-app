import 'package:unico_app/app/modules/notification/presentation/controller/notification_controller.dart';
import 'package:unico_app/app/modules/notification/presentation/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 06-09-2022 10:31 PM
///
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);
  static const routeName = "/notification";

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late NotificationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<NotificationController>()
        ? Get.find<NotificationController>()
        : Get.put(NotificationController());
  }

  @override
  Widget build(BuildContext context) {
    return const NotificationScreen();
  }
}
