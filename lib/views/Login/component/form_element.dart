import 'package:flutter/material.dart';
import 'package:meteor_app/views/Common/checkbox_element.dart';
import 'package:meteor_app/views/Common/input_element.dart';

import 'package:meteor_app/views/Login/component/forgot_password_element.dart';

class FormElement extends StatefulWidget {
  const FormElement({super.key});

  @override
  State<FormElement> createState() => _FormElementState();
}

class _FormElementState extends State<FormElement> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputElement(
                  label: 'Username',
                  hintText: 'Enter your username',
                  validatorMessage: 'Username is not empty',
                  icon: Icons.mail_outline,
                  fieldController: _username),
              InputElement(
                  label: 'Password',
                  hintText: 'Enter your password',
                  validatorMessage: 'Password is not empty',
                  icon: Icons.lock_outlined,
                  fieldController: _passwordController),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [CheckboxElement(), ForgotPasswordElement()],
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
}
