import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';

void main() {
  test('app_animations assets test', () {
    expect(File(AppAnimations.splash).existsSync(), isTrue);
  });
}
