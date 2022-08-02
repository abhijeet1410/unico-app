///
/// Created by Sunil Kumar
/// On 01-08-2022 02:46 PM
///
import 'package:get_storage/get_storage.dart';

///
/// Created by Sunil Kumar
/// On 11-07-2022 07:54 AM
///
mixin AppStorageHelper {
  static const accessTokenKey = "user-access-token";
  static final _appStorage = GetStorage();

  static void init() async {
    // GetStorage.init();
    _appStorage.initStorage;
  }

  static Future<void> storeCounter(String token) async {
    _appStorage.write(accessTokenKey, token);
  }

  static String? get accessToken => _appStorage.read<String>(accessTokenKey);
}
