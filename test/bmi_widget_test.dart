import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BMI calculation interaction test', (WidgetTester tester) async {
    await tester.pumpWidget(BMICalculator());

    await tester.enterText(find.byType(TextFormField).at(0), '180');
    await tester.enterText(find.byType(TextFormField).at(1), '80');

    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(find.text('Your BMI is: 24.69'), findsOneWidget);
    expect(find.text('Normal weight'), findsOneWidget);
  });

  testWidgets('Reset button clears fields', (WidgetTester tester) async {
    await tester.pumpWidget(BMICalculator());

    await tester.enterText(find.byType(TextFormField).at(0), '180');
    await tester.enterText(find.byType(TextFormField).at(1), '80');

    await tester.tap(find.text('Calculate'));
    await tester.pump();

    await tester.tap(find.text('Reset'));
    await tester.pump();

    expect(find.text('180'), findsNothing);
    expect(find.text('80'), findsNothing);
  });
}
