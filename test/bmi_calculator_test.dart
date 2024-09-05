import 'package:bmi_calculator/models/bmi_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BMI calculation is correct', () {
    expect(calculateBMI(180, 80).toStringAsFixed(2), '24.69');
    expect(calculateBMI(160, 60).toStringAsFixed(2), '23.44');
  });

  test('BMI calculation handles edge cases', () {
    expect(calculateBMI(0, 70), 0.0);  // Zero height
    expect(calculateBMI(170, 0), 0.0);  // Zero weight
  });
}
