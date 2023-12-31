///
/// Created by Sunil Kumar from Boiler plate
///

abstract class PreferenceManager {
  static const String accessTokenKey = "user-access-token";

  Future<void> initStorage();

  Future<void> storeAccessToken(String token);

  String? get accessToken;

  Future<void> logout();

  Future<void> clear();
}
