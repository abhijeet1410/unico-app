import 'package:flutter/material.dart';

class BlockedUsersPage extends StatefulWidget {
  static const String routeName = '/blockedUsers';

  @override
  _BlockedUsersPageState createState() => _BlockedUsersPageState();
}

class _BlockedUsersPageState extends State<BlockedUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlockedUsers'),
      ),
    );
  }
}
