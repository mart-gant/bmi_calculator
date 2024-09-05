import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/ui/widgets/bmi_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BMIInputForm widget should validate input and calculate BMI', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BMIInputForm(
          onCalculate: (double height, double weight) {
            // No logic here, handled by the main widget itself
          },
        ),
      ),
    ));

    // Enter valid height and weight
    await tester.enterText(find.byType(TextFormField).at(0), '180');
    await tester.enterText(find.byType(TextFormField).at(1), '80');

    // Tap the Calculate button
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    // The onCalculate function is invoked - widget validated inputs
    expect(find.text('Calculate'), findsOneWidget);  // Check the button remains

    // Enter invalid height and weight
    await tester.enterText(find.byType(TextFormField).at(0), '');
    await tester.enterText(find.byType(TextFormField).at(1), '');

    // Tap Calculate again
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    // Expect the form validation to trigger an error and not call the callback
    expect(find.text('Please enter a valid height'), findsOneWidget);
    expect(find.text('Please enter a valid weight'), findsOneWidget);
  });

  testWidgets('BMI Calculation in Home Widget', (WidgetTester tester) async {
    // Build the whole app
    await tester.pumpWidget(BMICalculator());

    // Enter valid data into the height and weight fields
    await tester.enterText(find.byType(TextFormField).at(0), '180');
    await tester.enterText(find.byType(TextFormField).at(1), '80');

    // Tap Calculate
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    // Check if the BMI result is correctly displayed
    expect(find.text('Your BMI is: 24.69'), findsOneWidget);
    expect(find.text('Normal weight'), findsOneWidget);
  });

  testWidgets('Reset button clears the form and the result', (WidgetTester tester) async {
    // Build the whole app
    await tester.pumpWidget(BMICalculator());

    // Enter valid data into the height and weight fields
    await tester.enterText(find.byType(TextFormField).at(0), '180');
    await tester.enterText(find.byType(TextFormField).at(1), '80');

    // Tap Calculate
    await tester.tap(find.text('Calculate'));
    await tester.pump();

    // Verify BMI is shown
    expect(find.text('Your BMI is: 24.69'), findsOneWidget);
    expect(find.text('Normal weight'), findsOneWidget);

    // Tap Reset
    await tester.tap(find.text('Reset'));
    await tester.pump();

    // Check that the form and result have been cleared
    expect(find.text('Your BMI is: 24.69'), findsNothing);
    expect(find.text('Normal weight'), findsNothing);
    expect(find.text('180'), findsNothing);
    expect(find.text('80'), findsNothing);
  });
}
