import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_template_3/app/modules/notification/data/models/notification_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

///
/// Created by Sunil Kumar
/// On 18-08-2022 06:11 PM
///
abstract class AppNotificationManager {
  late String channelId;
  late String channelName;
  late String channelDescription;
  late String notificationTicker;

  Future<void> configureInAppNotification(
      {bool reqAlert = true, bool reqBadge = true, bool reqSound = true});
  void requestNotification(
      {bool alert = true, bool badge = true, bool sound = true});
  Future<void> cancelAllNotifications();
  Future<void> showNotification(NotificationDatum data);
  Future<void> showProgressNotification(NotificationDatum data);
  Future<void> showNotificationWithAttachment(NotificationDatum data);
  void onNotificationTapped(NotificationDatum data);
}
