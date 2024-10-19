import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle terms click
      },
      child: Text(
        'Terms & conditions',
        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
      ),
    );
  }
}
