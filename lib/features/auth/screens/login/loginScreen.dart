import 'package:aladia_mobile_app/features/auth/services/auth_service.dart';
import 'package:aladia_mobile_app/features/auth/widgets/divider.dart';
import 'package:aladia_mobile_app/features/auth/widgets/emailInputField.dart';
import 'package:aladia_mobile_app/features/auth/widgets/headerCard.dart';
import 'package:aladia_mobile_app/features/auth/widgets/primaryButton.dart';
import 'package:aladia_mobile_app/features/auth/widgets/socialLoginButton.dart';
import 'package:aladia_mobile_app/features/auth/widgets/termAndConditionText.dart';
import 'package:aladia_mobile_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final AuthService _authService = AuthService();

  // Function to handle login by email
  void _login(BuildContext context) async {
    try {
      // Check if the email exists using the AuthService
      bool emailExists =
          await _authService.checkIfEmailExists(_emailController.text);

      print("email exist $emailExists");
      if (!emailExists) {
        // Redirect to the signup page if the email doesn't exist
        context.go(AppRoutes.signup);
        return;
      }

      // If email exists, show a success message and redirect to the home page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email found. Redirecting to Home.'),
          backgroundColor: Colors.green,
        ),
      );

      // Delay the redirection to home for a moment
      Future.delayed(const Duration(seconds: 1), () {
        context.go(AppRoutes.home);
      });
    } catch (e) {
      print('Login error: $e');

      // Show an error message in a snackbar
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
                Center(
                  child: Text(
                    "Enter your email",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  hintText: 'E-mail',
                  icon: Icons.email,
                  controller: _emailController,
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Enter',
                  onPressed: () {
                    _login(context);
                  },
                ),
                const SizedBox(height: 30),
                DividerOr(),
                const SizedBox(height: 30),
                SocialLoginButton(
                  text: 'Sign in with Google',
                  imagePath: 'assets/images/google.png',
                  onPressed: () {
                    //hey
                  },
                ),
                const SizedBox(height: 30),
                SocialLoginButton(
                  text: 'Sign in with Facebook',
                  imagePath: 'assets/images/facebook.png',
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                SocialLoginButton(
                  text: 'Sign in with Apple',
                  imagePath: 'assets/images/apple.png',
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                TermsText(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
