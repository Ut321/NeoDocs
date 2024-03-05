import 'package:assignment1/controller/bar_controller.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final BarController controller;

  const TextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          int intialValue = int.tryParse(value) ?? 0;
          (intialValue < 1 || intialValue > 120)
              ? ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content:
                        Text('Please enter the value in the range (1-120)'),
                  ),
                )
              : controller.updateValue(intialValue);
        },
        decoration: const InputDecoration(
          labelText: 'Enter Value',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
