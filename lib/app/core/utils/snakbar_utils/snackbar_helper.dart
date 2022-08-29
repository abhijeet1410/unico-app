import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AppSnackBarUtil {
  static Future<void> show(String message, {isLong = false}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
