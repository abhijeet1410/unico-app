import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/base/base_view.dart';
import 'package:flutter_template_3/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_empty_widget.dart';
import 'package:flutter_template_3/app/modules/items/presentation/add_item_page.dart';
import 'package:flutter_template_3/app/modules/items/presentation/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/items/presentation/widgets/filled_tab_indicator.dart';

class ItemsScreen extends BaseView<ItemsController> {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: AppEmptyWidget(
        title: "Oops! No Items to show",
        subtitle: "Item list is empty. Please add new\nproducts to continue.",
        assetPath: AppAssets.emptyItems,
        buttonText: "+ Add new item",
        onReload: () {
          NavigationHelper.toNamed(AddItemsPage.routeName);
        },
      ),
    );
  }
}
