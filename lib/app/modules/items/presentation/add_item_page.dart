import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_back_button.dart';
import 'package:flutter_template_3/app/modules/items/presentation/screen/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/items/presentation/screen/menu_screen.dart';
import 'package:flutter_template_3/app/modules/items/presentation/widgets/filled_tab_indicator.dart';
import 'package:get/get.dart';

class AddItemsPage extends StatefulWidget {
  static const String routeName = '/add-item';
  const AddItemsPage({Key? key}) : super(key: key);

  @override
  State<AddItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<AddItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add item",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "You can add an item by providing information about the item in the below list.",
              style: TextStyle(color: Color(0xff4D4D4D)),
            ),
          ],
        ),
      ),
    );
  }
}
