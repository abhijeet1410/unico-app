import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class AppFileUtil {
  static Future<String> downloadAndSaveImage(String url, [String? name]) async {
    final fileName =
        name ?? "image${DateTime.now().millisecondsSinceEpoch}.jpg";
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    var file = File(filePath);
    if (!await file.exists()) file.create();
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
