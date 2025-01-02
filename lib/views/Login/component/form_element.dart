import 'package:flutter/material.dart';
import 'package:meteor_app/viewmodels/auth_viewmodel.dart';
import 'package:meteor_app/views/Common/checkbox_element.dart';
import 'package:meteor_app/views/Common/input_element.dart';
import 'package:provider/provider.dart';

import 'package:meteor_app/views/Login/component/forgot_password_element.dart';

class FormElement extends StatelessWidget {
  FormElement({super.key});

  final _formKey = GlobalKey<FormState>();

  final _username = TextEditingController();

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);
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
                  fieldController: _password),
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
                  onPressed: () {
                    final authViewModel =
                        Provider.of<AuthViewModel>(context, listen: false);

                    authViewModel.login(
                        context, _username.text, _password.text);
                  },
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
