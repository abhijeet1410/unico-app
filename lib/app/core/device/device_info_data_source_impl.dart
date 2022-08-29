import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source.dart';
import 'package:flutter_template_3/app/core/data/models/device_info_req_model.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification.dart';
import 'package:package_info/package_info.dart';

class DeviceInfoDataSourceImpl implements DeviceInfoDataSource {
  @override
  Future<DeviceInfoReqModel?> getDeviceInfo() async {
    String? fcmID = "";
    DeviceInfoReqModel? deviceInfoReqModel;
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String platformVersion = "";
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      platformVersion = packageInfo.version;
    } on Exception {
      platformVersion = 'Failed to get platform version.';
    }
    if (Platform.isAndroid) {
      fcmID = await FirebaseMessaging.instance.getToken();
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      deviceInfoReqModel = DeviceInfoReqModel(
          deviceId: androidDeviceInfo.id,
          deviceType: "1",
          appVersion: platformVersion,
          deviceBrand: androidDeviceInfo.model,
          deviceLocale: Platform.localeName,
          deviceManufacturer: androidDeviceInfo.manufacturer,
          deviceOsVersion: androidDeviceInfo.version.sdkInt.toString(),
          deviceTimeZone: DateTime.now().timeZoneName,
          deviceToken: fcmID,
          platform: "android");
    } else if (Platform.isIOS) {
      final NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        sound: true,
        alert: true,
        badge: true,
      );
      // AppNotificationManager.requestNotification();
      if (settings.alert == AppleNotificationSetting.enabled) {
        fcmID = await FirebaseMessaging.instance.getToken();
      }
      final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      deviceInfoReqModel = DeviceInfoReqModel(
          deviceId: iosDeviceInfo.identifierForVendor,
          deviceType: "2",
          appVersion: platformVersion,
          deviceBrand: iosDeviceInfo.model,
          deviceLocale: Platform.localeName,
          deviceManufacturer: iosDeviceInfo.utsname.machine,
          deviceOsVersion: iosDeviceInfo.systemVersion,
          deviceTimeZone: DateTime.now().timeZoneName,
          deviceToken: fcmID,
          platform: "ios");
    } else if (kIsWeb) {
      // final NotificationSettings settings =
      //     await FirebaseMessaging.instance.requestPermission(
      //   sound: true,
      //   alert: true,
      //   badge: true,
      // );
      // // AppNotificationManager.requestNotification();
      // if (settings.alert == AppleNotificationSetting.enabled) {
      //   fcmID = await FirebaseMessaging.instance.getToken();
      // }
      final webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
      deviceInfoReqModel = DeviceInfoReqModel(
          deviceId: webBrowserInfo.vendor,
          deviceType: "3",
          appVersion: platformVersion,
          deviceBrand: webBrowserInfo.userAgent,
          deviceLocale: Platform.localeName,
          deviceManufacturer: webBrowserInfo.browserName.name,
          deviceOsVersion: webBrowserInfo.appVersion,
          deviceTimeZone: DateTime.now().timeZoneName,
          deviceToken: fcmID,
          platform: "web");
    }
    return deviceInfoReqModel;
  }
}
