import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  // static final RxSharedPreferences _rxPreferences =
  // RxSharedPreferences(SharedPreferences.getInstance());

  static const String _accessTokenKey = "access_token";
  static const String _refreshTokenKey = "refresh_token";
  // Save tokens
  static Future<void> saveTokens(
      String accessToken, String refreshToken) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(_accessTokenKey, accessToken);

      await prefs.setString(_refreshTokenKey, refreshToken);
    } catch (e) {
      print("Error saving tokens: $e");
    }
  }

  // Get access token
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  // Get refresh token
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  // Clear tokens
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}
