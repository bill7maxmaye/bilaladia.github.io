import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // Get the screen width for responsive font sizing
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
      children: [
        Text(
          'Welcome to Aladia', // Define your title here
          style: TextStyle(
            fontSize: screenWidth * 0.05, // 6% of screen width for title size
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 8),
        Text(
          'Create or access your account from here', // Define your subtitle here
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            color: theme.primaryColor,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
