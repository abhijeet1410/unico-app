import 'package:unico_app/app/core/local/preference/preference_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class PreferenceManagerImpl implements PreferenceManager {
  late GetStorage _appStorage;

  @override
  String? get accessToken => _appStorage.read(PreferenceManager.accessTokenKey);

  @override
  Future<void> clear() {
    return _appStorage.erase();
  }

  @override
  Future<void> logout() {
    return _appStorage.remove(PreferenceManager.accessTokenKey);
  }

  @override
  Future<void> storeAccessToken(String token) {
    return _appStorage.write(PreferenceManager.accessTokenKey, token);
  }

  @override
  Future<void> initStorage() async {
    final b = await GetStorage.init("appStorage");
    print("initStorage $b");
    _appStorage = GetStorage("appStorage");
  }
}
