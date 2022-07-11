import 'package:flutter/material.dart';

class UnverifiedUsersPage extends StatefulWidget {
  static const String routeName = '/unverifiedUsers';

  @override
  _UnverifiedUsersPageState createState() => _UnverifiedUsersPageState();
}

class _UnverifiedUsersPageState extends State<UnverifiedUsersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnverifiedUsers'),
      ),
    );
  }
}
