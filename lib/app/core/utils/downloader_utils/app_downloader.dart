import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_template_3/app/core/utils/permission_utils/permission_util.dart';
import 'package:path_provider/path_provider.dart';

///
/// Created by Kumar Sunil on 18-06-2023
///
class AppDownloader {
  static Future startDownload(String url) async {
    try {
      if (await AppPermissions.getStoragePermission()) {
        final path = await getDownloadsDir();
        // if
        // await FlutterDownloader.enqueue(
        //   url: url,
        //   headers: {'auth': 'test_for_sql_encoding'},
        //   savedDir: path,
        //   saveInPublicStorage: _saveInPublicStorage,
        // );
      }
    } catch (e) {
      print('Error getting downloads directory: $e');
    }
  }

  static Future<String?> getDownloadsDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (err, st) {
        print('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}
