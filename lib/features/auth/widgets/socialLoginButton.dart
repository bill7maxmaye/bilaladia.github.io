import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth *
          0.8, // 80% of the screen width to align with other buttons
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.elevatedButtonTheme.style?.backgroundColor
              ?.resolve({}), // Background color
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Rounded corners
            side: BorderSide(
              color: Color.fromARGB(255, 54, 54, 54).withOpacity(0.1),
              // Light border
            ),
          ),
          padding:
              EdgeInsets.symmetric(vertical: 16), // Adjust padding for height
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Social Media Icon
            Image.asset(
              imagePath,
              width: 24, // Icon width
              height: 24, // Icon height
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12), // Space between icon and text

            // Button Text
            Flexible(
              // Wrap text in a Flexible to prevent overflow and allow flexibility
              child: Text(
                text,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 16, // Text size
                ),
                overflow:
                    TextOverflow.ellipsis, // Handle text overflow gracefully
                maxLines: 1, // Limit the text to a single line
              ),
            ),
          ],
        ),
      ),
    );
  }
}
