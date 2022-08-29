import 'package:intl/intl.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AppNumberUtils {
  String compactNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  String formatPrice(double price) {
    return price.toStringAsFixed(2).replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
  }

  String formatPercentage(double percentage) {
    return percentage.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
  }

  static String getNumberBeforeDecimals(double doubleValue) =>
      (doubleValue.toString()).split('.')[0];

  static String getNumberAfterDecimals(double doubleValue) =>
      (doubleValue.toString()).split('.')[1];
}
