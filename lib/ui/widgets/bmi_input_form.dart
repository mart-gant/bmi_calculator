import 'package:flutter/material.dart';

class BMIInputForm extends StatefulWidget {
  final void Function(double height, double weight) onCalculate;

  BMIInputForm({required this.onCalculate});

  @override
  _BMIInputFormState createState() => _BMIInputFormState();
}

class _BMIInputFormState extends State<BMIInputForm> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final height = double.parse(_heightController.text);
      final weight = double.parse(_weightController.text);
      widget.onCalculate(height, weight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Height in cm'),
            validator: (value) {
              if (value == null || value.isEmpty || double.tryParse(value) == null) {
                return 'Please enter a valid height';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Weight in kg'),
            validator: (value) {
              if (value == null || value.isEmpty || double.tryParse(value) == null) {
                return 'Please enter a valid weight';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _submit,
                child: Text('Calculate'),
              ),
              ElevatedButton(
                onPressed: () {
                  _heightController.clear();
                  _weightController.clear();
                  widget.onCalculate(0, 0);  // Reset callback
                },
                child: Text('Reset'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
