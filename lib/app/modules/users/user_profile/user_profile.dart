import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Kumar Sunil 07-06-2021 09:46 AM
///
class UserProfilePage extends StatefulWidget {
  static const String routeName = '/user';

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar("Title", "Message",
              showProgressIndicator: true,
              maxWidth: 200,
              snackPosition: SnackPosition.TOP);
        },
      ),
      body: Center(child: Text('PARAMS ${Get.parameters}')),
    );
  }
}
