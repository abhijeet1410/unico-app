import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification_handlers.dart';
import 'package:flutter_template_3/app/modules/notification/data/models/notification_response.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AppNotificationManager {
  static String channelId = 'com.flutter_template_3';
  static String channelName = 'General';
  static String channelDescription = 'General Notification Channel';
  static String notificationTicker = 'ticker';

  static String chatChannelId = 'com.flutter_template_3_chat';
  static String chatChannelName = 'Chat Notification';
  static String chatChannelDescription = 'Chat Notification Channel';

  static String promotionChannelId = 'com.flutter_template_3_promotion';
  static String promotionChannelName = 'Promotion Notification';
  static String promotionChannelDescription = 'Promotion Notification Channel';

  ///Configuration for flutter local notifications both android and ios
  static Future<void> configureInAppNotification(
      {bool reqAlert = true,
      bool reqBadge = true,
      bool reqSound = true}) async {
    await Firebase.initializeApp();
    await AwesomeNotifications().initialize(
        "resource://drawable/img",
        [
          NotificationChannel(
            channelGroupKey: '${channelId}_group',
            channelKey: channelId,
            channelName: channelName,
            defaultColor: AppColors.brightPrimary,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            channelDescription: channelDescription,
            enableVibration: true,
            enableLights: true,
            playSound: true,
          ),
          NotificationChannel(
            channelGroupKey: '${chatChannelId}_group',
            channelKey: chatChannelId,
            channelName: chatChannelName,
            defaultColor: AppColors.brightPrimary,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            channelDescription: chatChannelDescription,
            enableVibration: true,
            enableLights: true,
            playSound: true,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupName: channelName,
              channelGroupKey: '${channelId}_group'),
          NotificationChannelGroup(
              channelGroupName: chatChannelName,
              channelGroupKey: '${chatChannelId}_group'),
        ],
        debug: kDebugMode);
    if (!kIsWeb) {
      await AwesomeNotificationsFcm().initialize(
          onFcmSilentDataHandle: mySilentDataHandle,
          onFcmTokenHandle: myFcmTokenHandle,
          onNativeTokenHandle: myNativeTokenHandle,
          debug: kDebugMode);
    }
    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod);
  }

  ///request IOS notification permission
  static Future requestNotification(
      {bool alert = true, bool badge = true, bool sound = true}) async {
    if (kIsWeb) return;
    final res = await AwesomeNotifications().isNotificationAllowed();
    if (!res) {
      await AwesomeNotifications()
          .requestPermissionToSendNotifications(channelKey: channelId);
      await AwesomeNotifications()
          .requestPermissionToSendNotifications(channelKey: chatChannelId);
    }
  }

  static Future<String?> getDeviceFCMToken(
      {bool alert = true, bool badge = true, bool sound = true}) async {
    if (kIsWeb) return "";
    final res = await AwesomeNotifications().isNotificationAllowed();
    if (!res) {
      await AwesomeNotifications()
          .requestPermissionToSendNotifications(channelKey: channelId);
      await AwesomeNotifications()
          .requestPermissionToSendNotifications(channelKey: chatChannelId);
      return AwesomeNotificationsFcm().requestFirebaseAppToken();
    } else {
      return AwesomeNotificationsFcm().requestFirebaseAppToken();
    }
  }

  static Future<void> showNotification(
      {String title = '',
      String description = 'Demo notification.',
      String? imageUrl,
      NotificationDatum? data}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: data?.id.hashCode ?? 0,
            channelKey: channelId,
            title: title,
            body: description,
            payload: data?.toJson()),
        actionButtons: [
          NotificationActionButton(
              key: 'OPEN',
              label: 'Open',
              autoDismissible: true,
              requireInputText: false),
          NotificationActionButton(
              key: 'CANCEL', label: 'Cancel', autoDismissible: true),
        ]);
  }

  static Future<void> showChatNotification(
      {String title = '',
      String description = 'Demo notification.',
      String? imageUrl,
      NotificationDatum? data}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: data?.id.hashCode ?? 0,
            channelKey: chatChannelId,
            title: title,
            body: description,
            payload: data?.toJson()),
        actionButtons: [
          NotificationActionButton(
              key: 'REPLY',
              label: 'Reply',
              autoDismissible: false,
              requireInputText: true),
          NotificationActionButton(
              key: 'READ', label: 'Mark as read', autoDismissible: true),
        ]);
  }
}
