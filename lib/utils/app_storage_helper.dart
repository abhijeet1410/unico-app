import 'package:get_storage/get_storage.dart';

///
/// Created by Sunil Kumar
/// On 11-07-2022 07:54 AM
///
mixin AppStorageHelper {
  static const COUNTER_KEY = "counter";
  static final _appStorage = GetStorage();

  static void init() async {
    // GetStorage.init();
    _appStorage.initStorage;
  }

  static Future<void> storeCounter(int counter) async {
    final now = DateTime.now();
    _appStorage.write(COUNTER_KEY, counter);
  }

  static int get counter => _appStorage.read<int>(COUNTER_KEY) ?? 0;
}
