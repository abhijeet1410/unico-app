import 'dart:async';

import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.milliseconds = 1000});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
