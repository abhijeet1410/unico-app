import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<String> convertToPdfFromBase64(
    {required String base64String,
    String? fileName,
    String? fileExtension = ".pdf"}) async {
  Directory dir = await getApplicationDocumentsDirectory();
  final String currentTimeStamp =
      DateTime.parse(DateTime.now().toString()).toString().replaceAll(":", "_");

  List<int> pdf = base64.decode(base64String);

  String fileURL = "${dir.path}/${fileName}_$currentTimeStamp$fileExtension";

  File file = File(fileURL);

  if (!await file.exists()) file.create();
  file.writeAsBytes(pdf);

  return fileURL;
}
