import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:unico_app/app/core/theme/app_colors.dart';
import 'package:unico_app/app/core/utils/notification_utils/app_notification.dart';
import 'package:unico_app/app/modules/notification/data/models/notification_response.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

@pragma("vm:entry-point")
Future<void> mySilentDataHandle(FcmSilentData silentData) async {
  print('NOTIFICATION_SilentData: ${silentData.toString()}');

  if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
    print("NOTIFICATION_bg");
  } else {
    print("NOTIFICATION_FOREGROUND");
  }
  NotificationDatum notificationData =
      NotificationDatum.fromJson(silentData.data ?? {});
  if (notificationData.action == "CHAT" ||
      notificationData.action == "MESSAGE") {
    return AppNotificationManager.showChatNotification(
      title: notificationData.title,
      description: notificationData.description,
      // imageUrl: notificationData.user?.avatar ?? "",
      data: notificationData,
    );
  } else {
    return AppNotificationManager.showNotification(
      title: notificationData.title,
      description: notificationData.description,
      // imageUrl: notificationData.user?.avatar ?? "",
      data: notificationData,
    );
  }
}

@pragma("vm:entry-point")
Future<void> myFcmTokenHandle(String token) async {
  print('FCM Token:"$token"');
}

@pragma("vm:entry-point")
Future<void> myNativeTokenHandle(String token) async {
  print('Native Token:"$token"');
}

@pragma("vm:entry-point")
Future<void> onActionReceivedMethod(ReceivedAction action) async {
  print(
      'ACTION:"${action.buttonKeyPressed} ${action.buttonKeyInput} ${action.payload}"');
  final data = NotificationDatum.fromJson(action.payload ?? {});
  switch (action.buttonKeyPressed) {
    case "REPLY":
      break;
    case "READ":
      break;
    default:
      onNotificationTapped(data);
  }
}

@pragma("vm:entry-point")
Future<void> onNotificationCreatedMethod(ReceivedNotification action) async {
  print(
      'onNotificationCreatedMethod:"${action.id} ${action.title} ${action.createdSource}"');
  if (action.createdSource == NotificationSource.Firebase) {
    AwesomeNotifications().cancel(action.id!);
  }
  final data = NotificationDatum.fromJson(action.payload ?? {});
  if (data.id.hashCode != action.id) {
    if (data.action == "MESSAGE") {
      // if (!Get.currentRoute.contains(AllConversationsPage.routeName +
      //     ChatMessagesPage.getPath(data.parentEntityId ?? ""))) {
      return AppNotificationManager.showChatNotification(
        title: action.title ?? "",
        description: action.body ?? "",
        // imageUrl: notificationData.user?.avatar ?? "",
        data: data,
      );
    }
  } else {
    return AppNotificationManager.showNotification(
      title: action.title ?? "",
      description: action.body ?? "",
      // imageUrl: notificationData.user?.avatar ?? "",
      data: data,
    );
  }
}

@pragma("vm:entry-point")
Future<void> onNotificationDisplayedMethod(ReceivedNotification action) async {
  print('onNotificationDisplayedMethod:"${action.title} ${action.body}"');
}

// Future<dynamic> backgroundMessageHandler(RemoteMessage message) async {
//   try {
//     await Firebase.initializeApp();
//     RemoteNotification? notification = message.notification;
//
//     log('notification_settings data  --> ${notification?.title} ${notification?.body} ${jsonEncode(message.data)}');
//     NotificationDatum notificationData =
//         NotificationDatum.fromJson(Map<String, dynamic>.from(message.data));
//     if (notificationData.action == "CHAT" ||
//         notificationData.action == "MESSAGE") {
//     } else {
//       isNotificationNotifier.value = true;
//     }
//
//     if (Get.context != null && Platform.isAndroid) {
//       return AppNotificationManager.showNotification(
//         title: notification?.title ?? 'KemNu',
//         description: notification?.body ?? 'Description',
//         // imageUrl: notificationData.user?.avatar ?? "",
//         data: notificationData,
//       );
//     }
//   } catch (e, s) {
//     log('Notification StackTrace $e $s');
//   }
// }

void onReceiveNotification(payload) {
  if (payload != null) {
    onNotificationTapped(
        NotificationDatum.fromJson(json.decode(payload.payload ?? "{}")));
  }
}

void onNotificationTapped(NotificationDatum data) {
  print("NOTIFICATION_CLICK ${data.toJson()}");
  switch (data.action) {
    case 'HANGOUT_JOINEE':

    default:
      if (data.entityType == 'link') {
        try {
          launchUrl(Uri.parse(data.entityId));
        } catch (_) {
          print('Link open error');
        }
      }
  }
}
