import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/base/base_view.dart';
import 'package:flutter_template_3/app/modules/items/presentation/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/items/presentation/widgets/filled_tab_indicator.dart';

class MenuScreen extends BaseView<ItemsController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Menu")),
    );
  }
}
