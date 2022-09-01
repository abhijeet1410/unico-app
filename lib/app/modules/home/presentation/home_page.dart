import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification_impl.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_widgets.dart';
import 'package:flutter_template_3/app/modules/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const divider = Divider();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
          },
          child: const Icon(Icons.notification_important),
        ),
        body: controller.obx(
            (state) => RefreshIndicator(
                  onRefresh: controller.loadData,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state?[index].name ?? "Demo"),
                        );
                      },
                      separatorBuilder: (ctx, index) => divider,
                      itemCount: state?.length ?? 0),
                ),
            onError: (e) => AppErrorWidget(
                  title: e,
                  onRetry: controller.loadData,
                )));
  }
}
