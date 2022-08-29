import 'dart:convert' show base64;
import 'dart:io';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

///
/// Created by Sunil Kumar from Boiler plate
///

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
