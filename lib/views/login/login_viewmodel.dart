import 'package:flutter/material.dart';
import 'package:meteor_app/utils/routers.dart';
import 'package:meteor_app/views/base/base_viewmodel.dart';

class LoginViewmodel extends BaseViewModel {
  LoginViewmodel();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  final username = TextEditingController();
  final passwordController = TextEditingController();

  void onSwitchCheckbox(bool? value) {
    value ??= false;
    isChecked = value;
    notifyListeners();
  }

  void onPressedNavigateHomePage(){
    Navigator.pushNamed(context, Routers.profile);
  }
}
