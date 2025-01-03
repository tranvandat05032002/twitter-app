import 'package:flutter/material.dart';
import 'package:meteor_app/API/ApiClient.dart';
import 'package:meteor_app/models/auth_model.dart';
import 'package:meteor_app/models/base_model.dart';
import 'package:meteor_app/models/user_model.dart';
import 'package:meteor_app/utils/app_shared.dart';

class UserViewModel extends ChangeNotifier {
  BaseModel<UserInfo>? _userInfo;
  BaseModel<UserInfo>? get userInfo => _userInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchUserInfo() async {
    final String? accessToken = await TokenManager.getAccessToken();
    _isLoading = true;
    notifyListeners();
    try {
      if (accessToken != null) {
        final userInfo = await ApiClient.getUserInfo(accessToken);
        _userInfo = userInfo;
      }
    } catch (e) {
      print("Error fetching user info: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
