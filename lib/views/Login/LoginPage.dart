import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meteor_app/views/Login/component/footer_element.dart';
import 'package:meteor_app/views/Login/component/form_element.dart';
import 'package:meteor_app/views/Login/component/header_element.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: Colors.white),
        home: Scaffold(
            body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [HeaderElement(), FormElement(), FooterElement()],
          ),
        )));
  }
}
