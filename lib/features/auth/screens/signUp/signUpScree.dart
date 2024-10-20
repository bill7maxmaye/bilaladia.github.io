import 'package:aladia_mobile_app/features/auth/services/auth_service.dart';
import 'package:aladia_mobile_app/features/auth/widgets/emailInputField.dart';
import 'package:aladia_mobile_app/features/auth/widgets/headerCard.dart';
import 'package:aladia_mobile_app/features/auth/widgets/primaryButton.dart';
import 'package:aladia_mobile_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  //final TextEditingController emailController = TextEditingController();

  SignUpScreen({super.key});

  // Controllers for input fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService();

  // Function to handle signup logic
  void _signUp(BuildContext context) async {
    final String firstName = _firstNameController.text.trim();
    final String lastName = _lastNameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    // Validate all fields
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validate if passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Call the signup method from AuthService
      bool isSignedUp = await _authService.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      if (isSignedUp) {
        // Signup successful, redirect to login screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup successful! Redirecting to login.'),
            backgroundColor: Colors.green,
          ),
        );

        Future.delayed(const Duration(seconds: 1), () {
          context.go(AppRoutes.login); // Redirect to login page
        });
      } else {
        // Signup failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Signup error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve current theme data from the context
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      // Dynamic background color based on theme
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                HeaderCard(),
                SizedBox(height: 30),
                CustomInputField(
                  hintText: 'First Name',
                  icon: Icons.person,
                  controller: _firstNameController,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  hintText: 'Last Name',
                  icon: Icons.person,
                  controller: _lastNameController,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  hintText: 'E-mail',
                  icon: Icons.email,
                  controller: _emailController,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true, // To hide the password text
                  controller: _passwordController,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: true,
                  controller: _confirmPasswordController,
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Enter',
                  onPressed: () {
                    _signUp(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
