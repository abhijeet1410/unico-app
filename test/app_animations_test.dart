import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:unico_app/app/core/asset/resources.dart';

void main() {
  test('app_animations assets test', () {
    expect(File(AppAnimations.splash).existsSync(), isTrue);
  });
}
