import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Check if the theme is dark or light
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Handle terms click
      },
      child: Text(
        'Terms & conditions',
        style: TextStyle(
          color: isDarkMode
              ? Colors.white.withOpacity(0.7)
              : Colors.black
                  .withOpacity(0.7), // White in dark mode, black in light mode
          fontSize: 14,
        ),
      ),
    );
  }
}
