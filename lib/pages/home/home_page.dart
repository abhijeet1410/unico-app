import 'package:flutter/material.dart';
import 'package:flutter_template_3/pages/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const content = "  KUMARSUNIL17";
    const divider = Divider();

    return Scaffold(
        body: controller.obx((state) => ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state?[index].name ?? "DEMo"),
              );
            },
            separatorBuilder: (ctx, index) => divider,
            itemCount: state?.length ?? 0)));
  }
}
