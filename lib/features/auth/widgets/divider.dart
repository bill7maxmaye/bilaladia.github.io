import 'package:flutter/material.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Determine gradient color based on theme brightness
    final Color gradientColor = theme.brightness == Brightness.light
        ? Colors.black // Use black in light theme
        : Colors.white; // Use white in dark theme

    return Row(
      children: [
        // Left Side Gradient (from narrow to wider)
        Expanded(
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientColor.withOpacity(0.0), // Narrow (low opacity)
                  gradientColor.withOpacity(0.5), // Wider (higher opacity)
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
            "Or",
            style: TextStyle(
              color: gradientColor, // Text color based on theme
              fontSize: 16,
            ),
          ),
        ),
        // Right Side Gradient (from wider to narrow)
        Expanded(
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientColor.withOpacity(0.5), // Wider (higher opacity)
                  gradientColor.withOpacity(0.0), // Narrow (low opacity)
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
