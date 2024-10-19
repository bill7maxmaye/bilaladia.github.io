import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
//import 'package:widgetbook_knobs/widgetbook_knobs.dart';

class DividerOrUseCase extends StatelessWidget {
  const DividerOrUseCase(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Knobs for customizing the DividerOr component
    final String dividerText = context.knobs.string(
      label: 'Divider Text',
      initialValue: 'Or',
    );

    final Color textColor = context.knobs.color(
      label: 'Text Color',
      initialValue: Colors.white,
    );

    final double fontSize = context.knobs.double.slider(
      label: 'Font Size',
      min: 12,
      max: 24,
      initialValue: 16,
    );

    final Color dividerColor = context.knobs.color(
      label: 'Divider Color',
      initialValue: Colors.white,
    );

    final double leftOpacity = context.knobs.double.slider(
      label: 'Left Gradient Opacity',
      min: 0,
      max: 1,
      initialValue: 0.5,
    );

    final double rightOpacity = context.knobs.double.slider(
      label: 'Right Gradient Opacity',
      min: 0,
      max: 1,
      initialValue: 0.5,
    );

    final double dividerHeight = context.knobs.double.slider(
      label: 'Divider Height',
      min: 1,
      max: 6,
      initialValue: 3,
    );

    return Center(
      child: DividerOr(
        text: dividerText,
        textColor: textColor,
        fontSize: fontSize,
        dividerColor: dividerColor,
        leftOpacity: leftOpacity,
        rightOpacity: rightOpacity,
        height: dividerHeight,
      ),
    );
  }
}

class DividerOr extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final Color dividerColor;
  final double leftOpacity;
  final double rightOpacity;
  final double height;

  const DividerOr({
    Key? key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.dividerColor,
    required this.leftOpacity,
    required this.rightOpacity,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Side Gradient
        Expanded(
          child: Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  dividerColor.withOpacity(0.0), // Narrow (low opacity)
                  dividerColor
                      .withOpacity(leftOpacity), // Wider (higher opacity)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        // "Or" Text in the Middle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ),
        // Right Side Gradient
        Expanded(
          child: Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  dividerColor
                      .withOpacity(rightOpacity), // Wider (higher opacity)
                  dividerColor.withOpacity(0.0), // Narrow (low opacity)
                ],
                begin: Alignment.centerLeft, // Start wider
                end: Alignment.centerRight, // End narrow
              ),
            ),
          ),
        ),
      ],
    );
  }
}
