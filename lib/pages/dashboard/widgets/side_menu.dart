import 'package:flutter/material.dart';
import 'package:flutter_template_3/pages/feedback/feedback_page.dart';
import 'package:flutter_template_3/pages/home/home_page.dart';
import 'package:flutter_template_3/pages/review/review_page.dart';
import 'package:flutter_template_3/pages/users/all_users/users_page.dart';
import 'package:flutter_template_3/pages/users/blocked_users/blocked_users_page.dart';
import 'package:flutter_template_3/pages/users/unverfied_users/unverified_users_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.currentIndex,
    required this.onSelect,
  }) : super(key: key);
  final int currentIndex;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.shade400,
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                child: Text('A'),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  // DrawerListTile(
                  //   title: "Dashboard",
                  //   icon: Icon(Icons.home),
                  //   press: () => onSelect(0),
                  //   selected: currentIndex == 0,
                  // ),
                  // // ExpansionPanelList(
                  // //   children: [],
                  // // ),
                  // DrawerListTile(
                  //   title: "All Users",
                  //   icon: Icon(Icons.person),
                  //   press: () => onSelect(1),
                  //   selected: currentIndex == 1,
                  // ),
                  // DrawerListTile(
                  //   title: "Unverified Users",
                  //   icon: Icon(Icons.person),
                  //   press: () => onSelect(2),
                  // ),
                  // DrawerListTile(
                  //   title: "Blocked Users",
                  //   icon: Icon(Icons.person),
                  //   press: () => onSelect(3),
                  // ),
                  // DrawerListTile(
                  //   title: "Feedback",
                  //   icon: Icon(Icons.feedback),
                  //   press: () => onSelect(2),
                  //   selected: currentIndex == 2,
                  // ),
                  // DrawerListTile(
                  //   title: "Review",
                  //   selected: currentIndex == 3,
                  //   icon: Icon(Icons.reviews),
                  //   press: () => onSelect(3),
                  // ),
                  ...drawerData
                      .map((e) => DrawerEntryItem(
                          e, currentIndex, (index) => onSelect(index)))
                      .toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DrawerListTile extends StatelessWidget {
//   const DrawerListTile(
//       {Key? key,
//       required this.title,
//       required this.icon,
//       required this.press,
//       this.selected = false})
//       : super(key: key);
//
//   final bool selected;
//   final String title;
//   final Widget icon;
//   final VoidCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       selected: selected,
//       selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.2),
//       onTap: press,
//       horizontalTitleGap: 0.0,
//       leading: icon,
//       title: Text(title),
//     );
//   }
// }

class DrawerEntry {
  final String title;
  final int index;
  final Widget child;
  final List<DrawerEntry> children;
  DrawerEntry(this.title, this.index, this.child,
      [this.children = const <DrawerEntry>[]]);
}

final List<DrawerEntry> drawerData = <DrawerEntry>[
  DrawerEntry('Home', 0, HomePage()),
  DrawerEntry(
    'Users',
    1,
    UsersPage(),
    <DrawerEntry>[
      DrawerEntry('All Users', 1, UsersPage()),
      DrawerEntry('Unverified Users', 2, UnverifiedUsersPage()),
      DrawerEntry('Blocked Users', 3, BlockedUsersPage()),
    ],
  ),
  DrawerEntry('Feedback', 4, FeedbackPage()),
  DrawerEntry('Reviews', 5, ReviewPage()),
  // DrawerEntry('Transactions', 4, SizedBox(), [
  //   DrawerEntry('All Transactions', 1, AllTransactionsPage()),
  //   DrawerEntry('Pending transactions', 2, PendingTransactionPage()),
  // ]),
  // DrawerEntry(
  //   'Requests',
  //   5,
  //   SizedBox(),
  //   <DrawerEntry>[
  //     DrawerEntry('Verify requests', 1, VerifyRequestsPage()),
  //     DrawerEntry('Redeem requests', 2, RedeemRequestsPage())
  //   ],
  // ),
];

class DrawerEntryItem extends StatelessWidget {
  const DrawerEntryItem(this.entry, this.selectedIndex, this.onTap);
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
