import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

mixin AppFormValidators {
  static String? validateEmpty(dynamic data, [BuildContext? context]) {
    if (data == null) return "*required";
    if (data is String) {
      if (data.toString().trim().isEmpty) return "*required";
    }
    if (data is Iterable || data is Map) {
      if (data.isEmpty) return "*required";
    }
    return null;
  }

  static String? validateAmount(String? data, [BuildContext? context]) {
    if (data == null) return "*required";
    if (data.isNotEmpty) {
      double amount = double.parse(data);
      if (amount <= 0) {
        return "Invalid amount";
      } else {
        return null;
      }
    } else {
      return "*required";
    }
  }

  static String? validateMail(String? email, [BuildContext? context]) {
    if (email == null) return "*required";
    if (email.isEmpty) {
      return "*required";
    } else if (!GetUtils.isEmail(email)) {
      return "Invalid email id.";
    }
    return null;
  }

  static String? validatePhone(String? phone, [BuildContext? context]) {
    if (phone == null) return "*required";
    if (phone.isEmpty) {
      return "*required";
    } else if (!GetUtils.isPhoneNumber(phone)) {
      return "Invalid phone no.";
    }
    return null;
  }
}
