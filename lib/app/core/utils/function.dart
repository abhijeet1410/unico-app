import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

///
/// Created by Sunil Kumar from Boiler plate.
///
class AppFunctions {
  /// ui Image from Network image
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

  /// Get duration in mm:ss
  static String getDurationInMinutesAndSeconds(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static void launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      launchURL(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Convert Sunil Kumar Rocking to SK
  static String getInitialsText(String displayName) {
    String name = '';
    if (displayName.isNotEmpty) {
      List<String> splitterText = displayName.trim().split(" ");
      splitterText.removeWhere((value) => value.toString().trim().isEmpty);
      name = displayName[0];

      if (splitterText.isNotEmpty) {
        name = '$name${splitterText[1][0]}';
      }
    }
    return name;
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  static Color hexToColor(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
        'hex color must be #rrggbb or #rrggbbaa');

    return Color(
      int.parse(hex.substring(1), radix: 16) +
          (hex.length == 7 ? 0xff000000 : 0x00000000),
    );
  }

  /// Convert 1234567890987654 to 1234 5678 9098 7654
  static String getSplitCardNumber(String value) {
    String cardNumber = value.replaceAll(' ', '');
    StringBuffer bufferString = StringBuffer();
    for (int i = 0; i < cardNumber.length; i++) {
      bufferString.write(cardNumber[i]);
      int nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 &&
          nonZeroIndexValue != cardNumber.length) {
        bufferString.write(' ');
      }
    }

    return bufferString.toString();
  }

  static String getNumberBeforeDecimals(double doubleValue) =>
      (doubleValue.toString()).split('.')[0];

  static String getNumberAfterDecimals(double doubleValue) =>
      (doubleValue.toString()).split('.')[1];
}
