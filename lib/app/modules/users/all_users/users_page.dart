import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  static const String routeName = '/users';

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
    );
  }
}
