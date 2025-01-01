import 'package:flutter/material.dart';
import 'package:meteor_app/views/base/base_widget.dart';
import 'package:meteor_app/views/login/components/footer_element.dart';
import 'package:meteor_app/views/login/components/form_element.dart';
import 'package:meteor_app/views/login/components/header_element.dart';
import 'package:meteor_app/views/login/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      viewModel: LoginViewmodel(),
      // onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderElement(),
                FormElement(),
                FooterElement(),
              ],
            ),
          ),
        );
      },
    );
  }
}
