import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/pages/grid/presentation/grid_page.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_widgets.dart';
import 'package:flutter_template_3/app/modules/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<HomeController> {
  static const String routeName = '/home';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridPage<String>(
      currentState: GridPageState.loaded,
      data: List.generate(20, (index) => "List $index"),
      sliverAppBarBuilder: (BuildContext context, double per) => Container(
        color: Colors.pink.shade100,
        child: Text("HEHE Grid"),
      ),
      gridTileRatio: 1.2,
      gridSpacing: 12,
      gridPadding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, dynamic data, int index) => Card(
        child: Text("data"),
        color: Colors.blue.shade100,
      ),
      onLoadMore: () {
        print("LOAD MORE");
      },
    );
  }
}
