import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

///
/// Created by Sunil Kumar
/// On 29-08-2022 04:53 PM
///
class AppAssetUtils {
  static Future<ui.Image> getImageFromUrlPath(String url, [Size? size]) async {
    final imageFile = NetworkImage(url);
    final Completer<ui.Image> completer = Completer();
    imageFile
        .resolve(ImageConfiguration(size: size ?? Size(150, 150)))
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      if (!completer.isCompleted) completer.complete(info.image);
    }));
    return completer.future;
  }

  /// ByteList From Asset Image
  static Future<Uint8List> getBytesFromAsset(String path,
      {int? width, int? height}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: height ?? 150, targetWidth: width ?? 150);
    //! optional
    //  targetHeight: height, targetWidth: width
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  /// ByteList From Network image
  static Future<Uint8List> getBytesFromNetwork(String url) async {
    ui.Image image = await getImageFromUrlPath(url);
    ByteData byteData =
        (await image.toByteData(format: ui.ImageByteFormat.png))!;
    Uint8List uint8List = byteData.buffer.asUint8List();
    return uint8List;
  }
}
