import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterElement extends StatelessWidget {
  const FooterElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              margin: EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 251, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  print("Gmail clicked!");
                },
                icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                padding:
                    EdgeInsets.zero, // Loại bỏ padding mặc định của IconButton
              ),
            ),
            Container(
              width: 40,
              margin: EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 251, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  print("Facebook clicked!");
                },
                icon: FaIcon(FontAwesomeIcons.facebookF, color: Colors.blue),
                padding:
                    EdgeInsets.zero, // Loại bỏ padding mặc định của IconButton
              ),
            ),
            Container(
              width: 40,
              margin: EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 251, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  print("Apple clicked!");
                },
                icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                padding:
                    EdgeInsets.zero, // Loại bỏ padding mặc định của IconButton
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text.rich(TextSpan(text: "Don't have an account? ", children: [
          TextSpan(
              text: "Sign up",
              style: TextStyle(color: Color.fromRGBO(255, 118, 66, 1)))
        ]))
      ],
    );
  }
}
