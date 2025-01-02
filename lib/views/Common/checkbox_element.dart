import 'package:flutter/material.dart';

class CheckboxElement extends StatefulWidget {
  const CheckboxElement({super.key});

  @override
  State<CheckboxElement> createState() => _CheckboxElementState();
}

class _CheckboxElementState extends State<CheckboxElement> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
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
}
