import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/auth_preferences_repository.dart';

class AuthPreferencesRepositoryImplement extends AuthPreferencesRepository {
  AuthPreferencesRepositoryImplement(this._preferences);

  static const String prefix = 'auth';
  static const String _refreshTokenKey = '${prefix}_refresh_token_key';
  static const String _accessTokenKey = '${prefix}_access_token_key';

  final SharedPreferences _preferences;

  @override
  Future setAccessToken(String token) =>
      _preferences.setString(_accessTokenKey, token);

  @override
  Future<void> clearAll() async {
    await _preferences.remove(_accessTokenKey);
    await _preferences.remove(_refreshTokenKey);
  }

  @override
  String? getAccessToken() => _preferences.getString(_accessTokenKey);
}
