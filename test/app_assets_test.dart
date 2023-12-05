import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:unico_app/app/core/asset/resources.dart';

void main() {
  test('app_assets assets test', () {
    expect(File(AppAssets.arrowDown).existsSync(), isTrue);
    expect(File(AppAssets.arrowNext).existsSync(), isTrue);
    expect(File(AppAssets.bellRing).existsSync(), isTrue);
    expect(File(AppAssets.close).existsSync(), isTrue);
    expect(File(AppAssets.delete).existsSync(), isTrue);
    expect(File(AppAssets.deleteOutlined).existsSync(), isTrue);
    expect(File(AppAssets.emptyItems).existsSync(), isTrue);
    expect(File(AppAssets.homeBottomNav).existsSync(), isTrue);
    expect(File(AppAssets.image).existsSync(), isTrue);
    expect(File(AppAssets.itemsBottomNav).existsSync(), isTrue);
    expect(File(AppAssets.logo).existsSync(), isTrue);
    expect(File(AppAssets.notification).existsSync(), isTrue);
    expect(File(AppAssets.ordersBottomNav).existsSync(), isTrue);
    expect(File(AppAssets.placeholder).existsSync(), isTrue);
    expect(File(AppAssets.profileBottomNav).existsSync(), isTrue);
    expect(File(AppAssets.search).existsSync(), isTrue);
    expect(File(AppAssets.slotsBottomNav).existsSync(), isTrue);
    expect(File(AppAssets.tickSelected).existsSync(), isTrue);
    expect(File(AppAssets.tickUnselected).existsSync(), isTrue);
    expect(File(AppAssets.userPlaceholder).existsSync(), isTrue);
  });
}
