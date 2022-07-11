import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Created by Sunil Kumar
/// On 11-07-2022 07:54 AM
///
mixin AppStorageHelper {
  static const COUNTER_KEY = "counter";
  static final _appStorage = GetStorage();
  static late SharedPreferences _preferences;

  static void init() async {
    // GetStorage.init();
    _appStorage.initStorage;
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> storeCounter(int counter) async {
    final now = DateTime.now();
    print("STORE COUNTER");
    print(now.difference(now).inMilliseconds);
    _appStorage.write(COUNTER_KEY, counter).then((value) {
      print(DateTime.now().difference(now).inMilliseconds);
    });

    _preferences.setInt(COUNTER_KEY, counter).then((value) {
      print(DateTime.now().difference(now).inMilliseconds);
    });
  }

  static int get counter => _appStorage.read<int>(COUNTER_KEY) ?? 0;
}
