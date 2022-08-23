import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/widget/alert_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<bool> getStoragePermission(
      {BuildContext? context, String? subTitle}) async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      if (Platform.isAndroid) {
        if (status == PermissionStatus.permanentlyDenied ||
            status == PermissionStatus.denied ||
            status.isRestricted) {
          openPermissionSettingsDialog(context: context, subTitle: subTitle);

          return false;
        } else {
          return false;
        }
      } else if (Platform.isIOS) {
        Permission.storage.request().then((status) async {
          if (status == PermissionStatus.denied ||
              status == PermissionStatus.restricted) {
            openPermissionSettingsDialog(context: context, subTitle: subTitle);

            return false;
          } else {
            return false;
          }
        });
      }
    }
    return false;
  }

  static Future<bool> getCameraPermission({
    BuildContext? context,
    String? subTitle,
  }) async {
    PermissionStatus status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.denied) {
      return false;
    } else {
      if ((Platform.isAndroid &&
              status == PermissionStatus.permanentlyDenied) ||
          (Platform.isIOS &&
              (status == PermissionStatus.restricted ||
                  status == PermissionStatus.permanentlyDenied))) {
        openPermissionSettingsDialog(context: context, subTitle: subTitle);
        return false;
      } else {
        return false;
      }
    }
  }

  static void openPermissionSettingsDialog(
      {BuildContext? context, String? subTitle}) {
    showAppAlertDialog(
            title: "Permission Required",
            description: subTitle,
            positiveText: "Go to Settings",
            negativeText: "Cancel")
        .then((value) {
      if (value == true) {
        openAppSettings();
      }
    });
  }
}
