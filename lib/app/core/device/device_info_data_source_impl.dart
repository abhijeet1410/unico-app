import 'dart:async';
import 'dart:io';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source.dart';
import 'package:flutter_template_3/app/core/models/device_info_req_model.dart';
import 'package:flutter_template_3/app/core/utils/number_utils/number_utils.dart';
import 'package:package_info/package_info.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class DeviceInfoDataSourceImpl implements DeviceInfoDataSource {
  @override
  Future<DeviceInfoReqModel?> getDeviceInfo() async {
    String? fcmID = "";
    DeviceInfoReqModel? deviceInfoReqModel;
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String platformVersion = "";
    if (kIsWeb) {
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
      return DeviceInfoReqModel(
        deviceId:
            "${webBrowserInfo.appVersion}_${AppNumberUtils.getRandomNumber()}",
        deviceType: "3",
        appVersion: platformVersion,
        deviceBrand: webBrowserInfo.userAgent,
        deviceManufacturer: webBrowserInfo.browserName.name,
        deviceOsVersion: webBrowserInfo.appVersion,
        deviceTimeZone: DateTime.now().timeZoneName,
        deviceToken: fcmID,
        platform: "web",
      );
    }
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      platformVersion = packageInfo.version;
    } on Exception {
      platformVersion = 'Failed to get platform version.';
    }

    if (Platform.isAndroid) {
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
    }
    return deviceInfoReqModel;
  }
}
