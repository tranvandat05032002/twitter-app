import 'package:flutter/material.dart';

class ForgotPasswordElement extends StatelessWidget {
  const ForgotPasswordElement({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: null,
        child: Text(
          "Forgot password",
          style: TextStyle(decoration: TextDecoration.underline),
        ));
  }
}
