import 'package:flutter/material.dart';
import 'widgets/bmi_input_form.dart';
import 'widgets/bmi_result.dart';
import '../models/bmi_calculator.dart';

class BMICalculatorHome extends StatefulWidget {
  @override
  _BMICalculatorHomeState createState() => _BMICalculatorHomeState();
}

class _BMICalculatorHomeState extends State<BMICalculatorHome> {
  double _bmi = 0;
  String _result = "";

  void _calculateBMI(double height, double weight) {
    setState(() {
      _bmi = calculateBMI(height, weight);
      _result = getBMICategory(_bmi);
    });
  }

  void _reset() {
    setState(() {
      _bmi = 0;
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BMIInputForm(
              onCalculate: _calculateBMI,
            ),
            SizedBox(height: 20),
            BMIResult(bmi: _bmi, result: _result),
          ],
        ),
      ),
    );
  }
}
