double calculateBMI(double heightCm, double weightKg) {
  final heightM = heightCm / 100;
  return heightM == 0 ? 0 : weightKg / (heightM * heightM);
}

String getBMICategory(double bmi) {
  if (bmi < 18.5) return 'Underweight';
  if (bmi < 24.9) return 'Normal weight';
  if (bmi < 29.9) return 'Overweight';
  return 'Obesity';
}
