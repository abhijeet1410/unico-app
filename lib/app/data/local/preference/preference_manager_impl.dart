import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';

class PreferenceManagerImpl implements PreferenceManager {
  final _appStorage = GetStorage();

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
}
