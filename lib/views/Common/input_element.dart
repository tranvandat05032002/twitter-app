import 'package:flutter/material.dart';

class InputElement extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData icon;
  final String validatorMessage;
  final TextEditingController fieldController;
  const InputElement({
    super.key,
    required this.label,
    required this.hintText,
    required this.validatorMessage,
    required this.icon,
    required this.fieldController,
  });

  @override
  Widget build(BuildContext context) {
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
            hintText: hintText,
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
}
