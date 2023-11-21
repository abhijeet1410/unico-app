import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';
import 'package:flutter_template_3/app/core/utils/navigation_utils/navigation_helper.dart';
import 'package:flutter_template_3/app/core/widgets/alerts/alert_dialog.dart';
import 'package:flutter_template_3/app/modules/feedback/feedback_page.dart';
import 'package:flutter_template_3/app/modules/home/presentation/home_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/users/all_users/users_page.dart';
import 'package:flutter_template_3/app/modules/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/app/modules/users/unverfied_users/unverified_users_page.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.currentLocation,
    required this.onSelect,
  }) : super(key: key);
  final String currentLocation;
  final Function(DrawerEntry) onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Menu",
              style: TextStyle(fontSize: 16),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ...drawerData.map((e) {
                    final selected = (drawerData.indexOf(e) == 0 &&
                            currentLocation == '/') ||
                        currentLocation.contains(e.path);
                    return DrawerListTile(
                      title: e.title,
                      icon: e.icon == null
                          ? null
                          : SvgPicture.asset(e.icon!,
                              color: selected
                                  ? AppColors.brightPrimary
                                  : Colors.black),
                      press: () => onSelect(e),
                      selected: selected,
                    );
                  }).toList(),
                  const SizedBox(
                    height: 44,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      icon: const Icon(Icons.exit_to_app_rounded),
                      onPressed: () {
                        showAppAlertDialog(
                                title: "Logout",
                                description: "Are you sure want to logout?")
                            .then((value) {
                          if (value == true) {
                            Get.find<PreferenceManager>().logout();
                            NavigationHelper.back();
                            NavigationHelper.offAllNamed(LoginPage.routeName);
                          }
                        });
                      },
                      label: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 16),
                      ).paddingOnly(left: 12),
                    ).paddingSymmetric(horizontal: 12),
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key,
      required this.title,
      this.icon,
      required this.press,
      this.selected = false,
      this.expansionTile = false,
      this.children = const <DrawerListTile>[]})
      : super(key: key);

  final bool selected;
  final bool expansionTile;
  final String title;
  final Widget? icon;
  final VoidCallback press;
  final List<DrawerListTile> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selected ? AppColors.brightPrimary[50] : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          shape: BoxShape.rectangle),
      child: ListTile(
        selected: selected,
        onTap: press,
        horizontalTitleGap: 12.0,
        minVerticalPadding: 12,
        leading: icon,
        trailing: const Icon(Icons.navigate_next),
        title: Text(
          title,
          textScaleFactor: 0.9,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class DrawerEntry {
  final String title;
  final int index;
  final String path;
  final String? icon;
  final List<DrawerEntry> children;
  DrawerEntry(this.title, this.index, this.path, this.icon,
      [this.children = const <DrawerEntry>[]]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawerEntry &&
          runtimeType == other.runtimeType &&
          path == other.path;

  @override
  int get hashCode => path.hashCode;
}

final List<DrawerEntry> drawerData = <DrawerEntry>[
  DrawerEntry('OverView', 0, DashboardPage.routeName, null),
  DrawerEntry(
    'Settings',
    1,
    UnverifiedUsersPage.routeName,
    null,
  ),
  DrawerEntry(
    'Notifications',
    2,
    BlockedUsersPage.routeName,
    null,
  ),
];

class DrawerEntryItem extends StatelessWidget {
  const DrawerEntryItem(this.entry, this.selectedIndex, this.onTap,
      {super.key});

  final DrawerEntry entry;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    Widget _buildTiles(DrawerEntry root) {
      if (root.children.isEmpty) {
        return ListTile(
          tileColor: root.index == selectedIndex
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.transparent,
          selected: root.index == selectedIndex,
          onTap: () {
            onTap(root.index);
          },
          title: Text(root.title),
        );
      }
      return ExpansionTile(
        backgroundColor: Colors.transparent,
        key: PageStorageKey<DrawerEntry>(root),
        title: Text(root.title),
        initiallyExpanded: root.children.first.index <= selectedIndex &&
            selectedIndex <= root.children.last.index,
        children: root.children.map<Widget>(_buildTiles).toList(),
      );
    }

    return _buildTiles(entry);
  }
}
