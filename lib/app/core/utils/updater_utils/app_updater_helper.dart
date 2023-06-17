import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 07:03 pm
///
class AppUpdateHelper {
  static Future<void> checkForUpdate() async {
    if (kReleaseMode) {
      final AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          /// Perform immediate update
          final AppUpdateResult appUpdateResult =
              await InAppUpdate.performImmediateUpdate();
          if (appUpdateResult == AppUpdateResult.success) {
            /// App Update successful
          } else if (appUpdateResult == AppUpdateResult.userDeniedUpdate) {
            exit(0);
          }
        } else if (updateInfo.flexibleUpdateAllowed) {
          /// Perform flexible update
          InAppUpdate.startFlexibleUpdate()
              .then((AppUpdateResult appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              /// App Update successful
              InAppUpdate.completeFlexibleUpdate();
            }
          });
        }
      }
    }
  }
}
