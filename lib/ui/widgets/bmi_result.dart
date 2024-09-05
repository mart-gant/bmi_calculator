import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final double bmi;
  final String result;

  BMIResult({required this.bmi, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bmi == 0 ? '' : 'Your BMI is: ${bmi.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          result,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
