import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/modules/items/presentation/screen/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/items/presentation/screen/menu_screen.dart';
import 'package:flutter_template_3/app/modules/items/presentation/widgets/filled_tab_indicator.dart';
import 'package:get/get.dart';

class ItemsPage extends StatefulWidget {
  static const String routeName = '/items';
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Items"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppAssets.search,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ))
          ],
        ),
        body: Column(
          children: [
            Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xffCCCCCC), width: 1),
                      ),
                    ),
                  ),
                  TabBar(
                      indicatorColor: Get.theme.primaryColor,
                      indicator: const FilledTabIndicator(),
                      tabs: [
                        Tab(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("All Items"),
                            const SizedBox(width: 6),
                            Material(
                              color: Get.theme.primaryColor,
                              shape: const StadiumBorder(),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                        const Tab(text: "Menu"),
                      ])
                ]),
            const Expanded(
                child: TabBarView(
              children: [
                ItemsScreen(),
                MenuScreen(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
