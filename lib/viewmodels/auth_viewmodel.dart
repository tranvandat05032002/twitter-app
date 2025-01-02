import 'package:flutter/material.dart';
import 'package:meteor_app/models/auth_model.dart';
import 'package:meteor_app/repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AuthResponse? _authResponse;
  AuthResponse? get authResponse => _authResponse;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _authResponse = await _authRepository.login(email, password);
    } catch (e) {
      print("Login failed: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
