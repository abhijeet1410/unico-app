abstract class PreferenceManager {
  static const accessTokenKey = "user-access-token";

  Future<void> initStorage();

  Future<void> storeAccessToken(String token);

  String? get accessToken;

  Future<void> logout();

  Future<void> clear();
}
