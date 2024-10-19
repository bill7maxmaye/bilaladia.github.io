import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

// Your SocialLoginButton widget
import 'package:aladia_mobile_app/features/auth/widgets/socialLoginButton.dart';

@UseCase(name: 'Social Login Button', type: SocialLoginButton)
Widget socialLoginButtonUseCase(BuildContext context) {
  // Knob for customizing button text
  final buttonText = context.knobs.string(
    label: 'Button Text',
    initialValue: 'Sign in with Google',
  );

  // Knob for customizing the image path
  final imagePath = context.knobs.string(
    label: 'Image Path',
    initialValue: 'assets/images/google.png', // Adjust to your image path
  );

  return Center(
    child: SocialLoginButton(
      text: buttonText, // Using the knob for button text
      imagePath: imagePath, // Using the knob for image path
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Social login button pressed!')),
        );
      },
    ),
  );
}
