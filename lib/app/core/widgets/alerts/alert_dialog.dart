import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unico_app/app/core/asset/resources.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_outline_button.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:get/get.dart';

Future<bool?> showAppAlertDialog(
    {String title = '',
    String? description,
    String positiveText = 'Ok',
    String negativeText = 'Cancel',
    bool barrierDismissible = true}) async {
  if (Platform.isIOS) {
    if (Get.key.currentContext != null) {
      return showCupertinoModalPopup<bool>(
        context: Get.key.currentContext!,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(title),
          message: description == null ? null : Text(description),
          actions: <Widget>[
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Get.back(result: true);
              },
              child: Text(positiveText),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(negativeText),
            onPressed: () {
              Get.back(result: false);
            },
          ),
        ),
      );
    } else {
      return Get.dialog(
          CupertinoAlertDialog(
            title: Text(title),
            content: description != null ? Text(description) : null,
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(negativeText),
                onPressed: () {
                  Get.back(result: false);
                },
              ),
              CupertinoDialogAction(
                child: Text(positiveText),
                onPressed: () => Get.back(result: true),
              ),
            ],
          ),
          barrierDismissible: barrierDismissible);
    }
  }

  return Get.dialog<bool>(
      Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  "Alert",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                CloseButton(),
              ],
            ),
            Material(
              clipBehavior: Clip.antiAlias,
              type: MaterialType.circle,
              color: Get.theme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Text(
                  "!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: AppOutlineButton(
                      padding: EdgeInsets.all(14),
                      child: Text(negativeText),
                      color: Colors.black,
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      onPressed: () => Get.back(result: false),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppPrimaryButton(
                      padding: EdgeInsets.zero,
                      color: Colors.black,
                      child: Text(positiveText),
                      onPressed: () => Get.back(result: true),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // AlertDialog(
      //   title: Text(title),
      //   content: description != null ? Text(description) : null,
      //   actions: <Widget>[
      //     TextButton(
      //       child: Text(negativeText),
      //       onPressed: () {
      //         Get.back(result: false);
      //       },
      //     ),
      //     TextButton(
      //       child: Text(positiveText),
      //       onPressed: () => Get.back(result: true),
      //     ),
      //   ],
      // ),
      barrierDismissible: barrierDismissible);
}
