import 'package:url_launcher/url_launcher_string.dart';

///
/// Created by Sunil Kumar
/// On 29-08-2022 04:56 PM
///
class AppStringUtils {
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
}
