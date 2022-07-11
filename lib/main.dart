import 'package:flutter/material.dart';
import 'package:flutter_template_3/utils/app_storage_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/home_page.dart';

void main() {
  AppStorageHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
