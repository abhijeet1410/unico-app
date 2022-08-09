import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/core/theme/app_theme.dart';

Future<bool?> showAppAlertDialog(
    {String title = '',
    String? description,
    String positiveText = 'Ok',
    String negativeText = 'Cancel'}) async {
  if (Platform.isIOS) {
    return Get.dialog<bool>(CupertinoAlertDialog(
      title: Text(title),
      content: description != null ? Text(description) : null,
      actions: [
        CupertinoDialogAction(
          child: Text(negativeText),
          onPressed: () {
            Get.back(result: false);
          },
        ),
        CupertinoDialogAction(
          textStyle: const TextStyle(fontFamily: AppThemes.fontFamily),
          child: Text(positiveText),
          onPressed: () => Get.back(result: true),
        ),
      ],
    ));
  } else {
    return Get.dialog<bool>(AlertDialog(
      title: Text(title),
      content: description != null ? Text(description) : null,
      actions: [
        TextButton(
          child: Text(negativeText),
          onPressed: () {
            Get.back(result: false);
          },
        ),
        TextButton(
          child: Text(positiveText),
          onPressed: () => Get.back(result: true),
        ),
      ],
    ));
  }
}
