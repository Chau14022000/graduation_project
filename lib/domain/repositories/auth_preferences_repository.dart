abstract class AuthPreferencesRepository {
  Future<void> setAccessToken(String token);

  String? getAccessToken();

  Future<void> clearAll();
}
