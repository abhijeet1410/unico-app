import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';
import 'package:flutter_template_3/app/core/utils/notification_utils/app_notification.dart';
import 'package:flutter_template_3/firebase_options.dart';
import 'package:get/get.dart';

import 'package:flutter_template_3/app/modules/notification/data/models/notification_response.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
@pragma("vm:entry-point")
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    RemoteNotification? notification = message.notification;
    // print("SUNIL backgroundMessageHandler");

    // print(
    //     'Background notification --> ${notification?.title} ${notification?.body} ${jsonEncode(message.data)}');
    final map = jsonDecode(Map<String, dynamic>.from(message.data)["json"]);

    NotificationDatum notificationData = NotificationDatum.fromJson(map);

    if (Get.context != null) {
      if (Get.isRegistered()) {
        return Get.find<AppNotificationManager>().showNotification(
            notification?.title ?? "",
            notification?.body ?? "",
            notificationData);
      } else {
        final controller = Get.put<AppNotificationManager>(
            AppNotificationManagerImpl(),
            permanent: true);
        await controller.configureInAppNotification(
            reqAlert: true, reqBadge: true, reqSound: true);
        controller.showNotification(notification?.title ?? "",
            notification?.body ?? "", notificationData);
      }
    }
  } catch (e) {
    print('Background Notification Error $e');
  }
}

void callBack2(NotificationResponse notificationResponse) {
  // print("SUNIL callback2");
  try {
    if (notificationResponse.payload != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final data = NotificationDatum.fromJson(
            jsonDecode(notificationResponse.payload!));
        // if (data.entityType == "order") {
        //   Get.toNamed(OrderDetailsPage.getPath(data.entityId));
        // }
      });
    }
  } catch (e, s) {
    log('Background Notification Error ${notificationResponse.payload}',
        error: e, stackTrace: s);
  }
}

void callBack1(RemoteMessage data) {
  // print("SUNIL callback1 ${data.data}");
  try {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // final order = Order.fromJson(json.decode(data.data["json"]));
      // Get.toNamed(OrderDetailsPage.getPath(order.id));
    });
  } catch (e, s) {
    log('Background Notification Error', error: e, stackTrace: s);
  }
}

class AppNotificationManagerImpl extends AppNotificationManager {
  final FlutterLocalNotificationsPlugin flutterLocalNotifications =
      FlutterLocalNotificationsPlugin();

  @override
  String get channelId => 'in.buysale.customer/notification';

  @override
  String get channelName => 'BuySale Notification';

  @override
  String get channelDescription => 'BuySale Notification Channel';

  @override
  String get notificationTicker => "ticker";

  @override
  Future<void> cancelAllNotifications() {
    return flutterLocalNotifications.cancelAll();
  }

  @override
  Future<void> configureInAppNotification(
      {bool reqAlert = true,
      bool reqBadge = true,
      bool reqSound = true}) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //
    // NotificationAppLaunchDetails? notificationAppLaunchDetails =
    //     await flutterLocalNotifications.getNotificationAppLaunchDetails();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsDarwin = DarwinInitializationSettings(
        requestAlertPermission: reqAlert,
        requestBadgePermission: reqBadge,
        requestSoundPermission: reqSound,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {
          if (payload != null) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              try {
                // final order = Order.fromJson(jsonDecode(payload));
                // Get.toNamed(OrderDetailsPage.getPath(order.id));
                print("SUNIL onDidReceiveLocalNotification");
              } catch (e, s) {
                log('onDidReceiveLocalNotification Error',
                    error: e, stackTrace: s);
              }
            });
          }
        });
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin);
    await flutterLocalNotifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse: callBack2,
        onDidReceiveBackgroundNotificationResponse: callBack2);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: reqAlert,
      badge: reqBadge,
      sound: reqSound,
    );
    FirebaseMessaging.instance.getToken().then((value) {
      print("FCMID $value");
      // if (payload != null)
      //   onNotificationTapped(
      //       NotificationDatum.fromJson(json.decode(payload)))
    });
    await flutterLocalNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(AndroidNotificationChannel(
          channelId,
          channelName,
          description: channelDescription,
          importance: Importance.max,
        ));

    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    // FirebaseMessaging.onMessage.listen((v) {
    // isNotificationNotifier.value = true;
    // if (Platform.isAndroid) {
    // backgroundMessageHandler(v);
    // }
    // });
    FirebaseMessaging.onMessage.listen(backgroundMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(callBack1);
  }

  @override
  void requestNotification(
      {bool alert = true, bool badge = true, bool sound = true}) {
    flutterLocalNotifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: alert,
          badge: badge,
          sound: sound,
        );

    if (Platform.isIOS || Platform.isMacOS) {
      flutterLocalNotifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      flutterLocalNotifications
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotifications.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      androidImplementation?.requestPermission();
    }
  }

  @override
  Future<void> showNotification(
      String title, String body, NotificationDatum data) {
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(badgeNumber: 1);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      icon: '@mipmap/ic_launcher',
      styleInformation: const DefaultStyleInformation(true, true),
      importance: Importance.max,
      priority: Priority.max,
      ticker: notificationTicker,
      enableLights: true,
      color: AppColors.brightPrimary,
    );
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: iOSPlatformChannelSpecifics,
        android: androidPlatformChannelSpecifics);
    return flutterLocalNotifications.show(
        data.id.hashCode, title, body, notificationDetails,
        payload: jsonEncode(data.toJson()));
  }

  @override
  Future<void> showProgressNotification(NotificationDatum data) async {
    // const int maxProgress = 5;
    // for (int i = 0; i <= maxProgress; i++) {
    //   await Future<void>.delayed(const Duration(seconds: 1), () async {
    //     final AndroidNotificationDetails androidPlatformChannelSpecifics =
    //         AndroidNotificationDetails(channelId,channelName,
    //             channelDescription: channelDescription,
    //             channelShowBadge: false,
    //             importance: Importance.max,
    //             priority: Priority.max,
    //             onlyAlertOnce: true,
    //             showProgress: true,
    //             maxProgress: maxProgress,
    //             progress: i);
    //     final NotificationDetails platformChannelSpecifics =
    //         NotificationDetails(android: androidPlatformChannelSpecifics);
    //     return flutterLocalNotifications.show(data.id.hashCode, data.title,
    //         data.message, platformChannelSpecifics,
    //         payload: jsonEncode(data.toJson()));
    //   });
    // }
  }

  @override
  Future<void> showNotificationWithAttachment(NotificationDatum data) async {}
// static Future<void> configureInAppNotification(
//     {bool reqAlert = true,
//     bool reqBadge = true,
//     bool reqSound = true}) async {
//   await Firebase.initializeApp();
//
//   notificationAppLaunchDetails =
//       await flutterLocalNotifications.getNotificationAppLaunchDetails();
//   var initializationSettingsAndroid =
//       AndroidInitializationSettings('@drawable/img');
//   var initializationSettingsIOS = IOSInitializationSettings(
//       requestAlertPermission: reqAlert,
//       requestBadgePermission: reqBadge,
//       requestSoundPermission: reqSound,
//       onDidReceiveLocalNotification:
//           (int id, String? title, String? body, String? payload) async {
//         if (payload != null) {
//           onNotificationTapped(
//               NotificationDatum.fromJson(json.decode(payload)));
//         }
//       });
//   var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//   await flutterLocalNotifications.initialize(initializationSettings,
//       onSelectNotification: (payload) async => {
//             if (payload != null)
//               onNotificationTapped(
//                   NotificationDatum.fromJson(json.decode(payload)))
//           });
//   await FirebaseMessaging.instance
//       .setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   FirebaseMessaging.instance.getToken().then((value) {
//     print("FCMID $value");
//   });
//   await flutterLocalNotifications
//       .resolvePlatformSpecificImplementation<
//           AndroidflutterLocalNotifications>()
//       ?.createNotificationChannel(const AndroidNotificationChannel(
//         channelId,
//         channelName,
//         description: channelDescription,
//         importance: Importance.high,
//       ));
//   await FirebaseMessaging.instance
//       .setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
//   // FirebaseMessaging.onMessage.listen((v) {
//   // isNotificationNotifier.value = true;
//   // if (Platform.isAndroid) {
//   // backgroundMessageHandler(v);
//   // }
//   // });
//   FirebaseMessaging.onMessage.listen(backgroundMessageHandler);
//   FirebaseMessaging.onMessageOpenedApp.listen((data) => onNotificationTapped(
//       NotificationDatum.fromJson(Map<String, dynamic>.from(data.data))));
//   // FirebaseMessaging.instance.configure(
//   //     onMessage: backgroundMessageHandler,
//   //     onBackgroundMessage: Platform.isIOS ? null : backgroundMessageHandler,
//   //     onLaunch: (message) async {
//   //       try {
//   //         Map<dynamic, dynamic> data = message['data'];
//   //         // Get.offAndToNamed(DashboardPage.routeName);
//   //         log('onLaunch $data');
//   //         // Get.offAndToNamed(DashboardPage.routeName);
//   //         // Future.delayed(Duration(seconds: 2)).then((value) {
//   //         //   onNotificationTapped(
//   //         //       ActivityDatum.fromJson(Map<String, dynamic>.from(data)));
//   //         // });
//   //       } catch (e, s) {
//   //         debugPrint('$e $s');
//   //       }
//   //     },
//   //     onResume: (message) async {
//   //       try {
//   //         Map<dynamic, dynamic> data = message['data'];
//   //         log('onResume $data');
//   //
//   //         // onNotificationTapped(
//   //         //     ActivityDatum.fromJson(Map<String, dynamic>.from(data)));
//   //       } catch (e, s) {
//   //         debugPrint('$e $s');
//   //       }
//   //     });
//   // _firebaseMessaging.requestNotificationPermissions(
//   //     const IosNotificationSettings(
//   //         sound: true, badge: true, alert: true, provisional: true));
//   // _firebaseMessaging.onIosSettingsRegistered
//   //     .listen((IosNotificationSettings settings) {});
// }
//
// ///request IOS notification permission
// static void requestNotification(
//     {bool alert = true, bool badge = true, bool sound = true}) {
//   flutterLocalNotifications
//       .resolvePlatformSpecificImplementation<
//           IOSflutterLocalNotifications>()
//       ?.requestPermissions(
//         alert: alert,
//         badge: badge,
//         sound: sound,
//       );
// }
//
// static Future<void> showNotification(
//     {String title = 'Demo',
//     String description = 'Demo notification.',
//     String imageUrl = 'http://via.placeholder.com/128x128/00FF00/000000',
//     NotificationDatum? data}) async {
//   // if(data.entityType =="")
//   // final String? largeIconPath =
//   //     await _downloadAndSaveFile(imageUrl, 'largeIcon');
//
//   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//     channelId, channelName,
//     channelDescription: channelDescription,
//     icon: '@drawable/img',
//     // largeIcon:
//     //     largeIconPath == null ? null : FilePathAndroidBitmap(largeIconPath),
//     styleInformation: DefaultStyleInformation(true, true),
//     importance: Importance.max,
//     priority: Priority.max,
//     ticker: notificationTicker,
//     enableLights: true,
//     color: AppColors.brightPrimary,
//   );
//   var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
//       presentSound: true,
//       presentAlert: true,
//       presentBadge: true,
//       badgeNumber: 1);
//   var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics);
//   try {
//     await flutterLocalNotifications.show(
//         data?.id.hashCode ?? 0, title, description, platformChannelSpecifics,
//         payload: json.encode(data));
//   } catch (e, s) {
//     debugPrint('$e $s');
//   }
// }

//   static Future<void> showMessagingNotification(MessageDatum data) async {
//     List<Message> messages = List();
//
//     final largeIconPath =
//         await _downloadAndSaveFile(data.user.avatar, 'largeIcon');
//
//     final user = Person(
//       name: data.user.name,
//       important: true,
//       key: data.user.id,
//       bot: false,
//       icon: largeIconPath != null
//           ? BitmapFilePathAndroidIcon(largeIconPath)
//           : null,
//     );
//
//     // if (data.attachments != null && data.attachments.isNotEmpty) {
//     //   final chatImage =
//     //   await _downloadAndSaveFile(data.attachments[0].file, 'chatImage');
//     //   messages.add(Message('📸 Photo', data.createdAt, user,
//     //       dataMimeType: chatImage != null ? 'image/jpg' : null,
//     //       dataUri: chatImage != null
//     //           ? FilePathAndroidBitmap(chatImage).bitmap
//     //           : null));
//     // } else {
//     messages.add(Message(data.content.text, data.createdAt, user));
//     // }
//
//     final messagingStyle = MessagingStyleInformation(user,
//         groupConversation: false,
// //      conversationTitle: 'Group conversation',
//         htmlFormatContent: true,
//         htmlFormatTitle: true,
//         messages: messages);
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'alap message channel',
//         'alap message',
//         'alap message channel description',
//         importance: Importance.Max,
//         priority: Priority.Max,
//         category: 'msg',
//         styleInformation: messagingStyle);
//     var platformChannelSpecifics = NotificationDetails(
//         androidPlatformChannelSpecifics, IOSNotificationDetails());
//     final notification = ActivityDatum(
//         entityType: 'chat',
//         action: 'chat',
//         entityId: data.conversation,
//         user: data.user,
//         link: data.user.name,
//         createdAt: data.createdAt,
//         updatedAt: data.updatedAt);
//     await flutterLocalNotifications.show(
//         0, data.user.name, data.content.text, platformChannelSpecifics,
//         payload: json.encode(notification.toJson()));
//
//     // wait 10 seconds and add another message to simulate another response
// //    for (int i = 0; i < 5; i++) {
// //      await Future.delayed(Duration(seconds: 1), () async {
// //        messages.add(
// //            Message('Thai', DateTime.now().add(Duration(minutes: 11)), null));
// //        await flutterLocalNotifications.show(
// //            0, 'message title', 'message body', platformChannelSpecifics);
// //      });
// //    }
//   }
}
