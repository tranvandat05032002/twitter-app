import 'package:flutter/material.dart';
import 'package:meteor_app/views/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class CheckboxElement extends StatelessWidget {
  const CheckboxElement({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewmodel>();
    return Row(
      children: [
        SizedBox(width: 10),
        Checkbox(
            tristate: true,
            value: viewModel.isChecked,
            activeColor: Colors.blue,
            onChanged: (bool? value) {
              viewModel.onSwitchCheckbox(value);
            }),
        Text("Remember me")
      ],
    );
  }
}