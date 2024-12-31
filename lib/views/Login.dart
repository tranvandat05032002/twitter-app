import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  final _username = TextEditingController();
  final _passwordController = TextEditingController();
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

  Widget HeaderElement() {
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

  Widget FooterElement() {
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

  Widget FormElement() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Form(
          // key: _formKey,
          child: Column(
        children: [
          InputElement('Username', 'Enter your username',
              'Username is not empty', Icons.mail_outline, _username),
          InputElement(
              'Password',
              'Enter your password',
              'Password is not empty',
              Icons.lock_outlined,
              _passwordController),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CheckboxElement(), ForgotPassword()],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => null,
              child: Text(
                "Continue",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 118, 66, 1),
                  padding: EdgeInsets.only(top: 20, bottom: 20)),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }

  Widget InputElement(String label, String placeholder, String validatorMessage,
      IconData icon, TextEditingController fieldController) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
            hintText: placeholder,
            labelText: label,
            suffixIcon: IconButton(
              onPressed: null,
              icon: Icon(icon),
            )),
        controller: fieldController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMessage;
          }
        },
        onChanged: (text) {
          print('value ${text}');
        },
      ),
    );
  }

  Widget CheckboxElement() {
    return Row(
      children: [
        SizedBox(width: 10),
        Checkbox(
            tristate: true,
            value: isChecked,
            activeColor: Colors.blue,
            onChanged: (bool? value) {
              setState(() {
                if (value == null) {
                  value = false;
                }
                isChecked = value ?? false;
                print(value);
              });
            }),
        Text("Remember me")
      ],
    );
  }

  Widget ForgotPassword() {
    return TextButton(
        onPressed: null,
        child: Text(
          "Forgot password",
          style: TextStyle(decoration: TextDecoration.underline),
        ));
  }
}
