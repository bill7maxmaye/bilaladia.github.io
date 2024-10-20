import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:aladia_mobile_app/features/auth/screens/login/loginScreen.dart';

@UseCase(name: 'Login Screen', type: Loginscreen)
Widget loginScreenUseCase(BuildContext context) {
  return Scaffold(
    body: Loginscreen(), // Display the full login screen
  );
}
