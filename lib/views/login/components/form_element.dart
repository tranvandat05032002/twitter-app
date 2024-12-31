import 'package:flutter/material.dart';
import 'package:meteor_app/views/login/components/checkbox_element.dart';
import 'package:meteor_app/views/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class FormElement extends StatelessWidget {
  const FormElement({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewmodel>();
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Form(
          // key: _formKey,
          child: Column(
        children: [
          InputElement('Username', 'Enter your username',
              'Username is not empty', Icons.mail_outline, viewModel.username),
          InputElement(
              'Password',
              'Enter your password',
              'Password is not empty',
              Icons.lock_outlined,
              viewModel.passwordController),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckboxElement(),
                ForgotPassword(),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => viewModel.onPressedNavigateHomePage(),
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


  Widget ForgotPassword() {
    return TextButton(
        onPressed: null,
        child: Text(
          "Forgot password",
          style: TextStyle(decoration: TextDecoration.underline),
        ));
  }
}
