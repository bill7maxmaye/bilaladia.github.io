import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity, // Makes it responsive by taking the full width
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: Color.fromARGB(255, 79, 78, 78),
              width: 1.0), // White border
          padding: EdgeInsets.symmetric(vertical: 12), // Padding for height
          backgroundColor: Colors.transparent, // Transparent background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Slightly rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: theme.primaryColor, // White text color
            fontSize: 20, // Adjusted font size to fit the image example
          ),
        ),
      ),
    );
  }
}
