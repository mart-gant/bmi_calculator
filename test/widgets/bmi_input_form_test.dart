import 'package:bmi_calculator/ui/widgets/bmi_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BMIInputForm validates input', (WidgetTester tester) async {
    bool called = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BMIInputForm(
            onCalculate: (height, weight) {
              called = true;
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), '180');
    await tester.enterText(find.byType(TextFormField).at(1), '80');
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(called, isTrue);
  });
}
