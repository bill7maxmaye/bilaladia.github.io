import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:aladia_mobile_app/features/auth/widgets/primaryButton.dart';

@UseCase(name: 'Primary Button', type: PrimaryButton)
Widget primaryButtonUseCase(BuildContext context) {
  // Fetch button text with a fallback value to prevent null
  final buttonText = context.knobs.string(
        label: 'Button Text',
        initialValue: 'Enter', // Default value if the knob is empty
      ) ??
      'Primary Button'; // Fallback to prevent null

  return Center(
    child: SizedBox(
      width: 400, // Explicit width for button
      child: PrimaryButton(
        text: buttonText,
        onPressed: () {
          // Show a Snackbar when the button is pressed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Primary button pressed!')),
          );
        },
      ),
    ),
  );
}
