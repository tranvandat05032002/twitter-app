import 'package:flutter/material.dart';
import 'package:meteor_app/API/ApiClient.dart';
import 'package:meteor_app/models/auth_model.dart';
import 'package:meteor_app/models/base_model.dart';
import 'package:meteor_app/utils/app_shared.dart';
import 'package:meteor_app/views/Dashboard.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  BaseModel<AuthResponse>? _authResponse;
  BaseModel<AuthResponse>? get authResponse => _authResponse;

  Future<void> login(
      BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TokenManager _tokenManager = new TokenManager();
      _authResponse = await ApiClient.login(email, password);
      final String? accessToken = _authResponse?.result.accessToken;
      final String? refreshToken = _authResponse?.result.refreshToken;
      if (accessToken != null && refreshToken != null) {
        await TokenManager.saveTokens(accessToken, refreshToken);
        final String? token = await TokenManager.getAccessToken();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    } catch (e) {
      print("Login failed: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
