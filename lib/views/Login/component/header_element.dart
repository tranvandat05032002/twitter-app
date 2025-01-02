import 'package:flutter/material.dart';

class HeaderElement extends StatelessWidget {
  const HeaderElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 70, top: 30),
      child: Column(
        children: [
          Text(
            "Login to access",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 290,
            child: Text(
              style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
              ),
              "Sign in with your username and password or continue with social media",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
