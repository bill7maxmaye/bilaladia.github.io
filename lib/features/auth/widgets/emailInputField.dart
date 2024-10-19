import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const CustomInputField({
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity, // Full width for responsiveness
      padding: EdgeInsets.symmetric(horizontal: 16), // Padding to match button
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey), // Icon with grey color
          hintText: hintText,
          hintStyle:
              theme.inputDecorationTheme.hintStyle, // Hint text with grey color
          filled: true,
          fillColor: theme.inputDecorationTheme
              .fillColor, // White background for the input field
          contentPadding: const EdgeInsets.symmetric(
              vertical: 16), // Adjusted padding for height consistency
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
            borderSide: BorderSide.none, // Remove border for a clean look
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Colors.transparent), // Transparent border
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.transparent), // Transparent border when focused
          ),
        ),
        style: TextStyle(color: Colors.black),
        //style: theme.textTheme.labelMedium, // Text input color
      ),
    );
  }
}
