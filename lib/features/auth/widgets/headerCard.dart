import 'package:aladia_mobile_app/features/auth/Bloc/theme_bloc.dart';
import 'package:aladia_mobile_app/features/auth/Bloc/theme_event.dart';
import 'package:aladia_mobile_app/features/auth/widgets/appLogo.dart';
import 'package:aladia_mobile_app/features/auth/widgets/welcomeText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Determine if the theme is light or dark
    bool isDarkTheme = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(10.0), // Padding inside the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        gradient: LinearGradient(
          colors: isDarkTheme
              ? [
                  Colors.black.withOpacity(0.8),
                  Color.fromARGB(230, 63, 63, 63),
                ]
              : [
                  Colors.white.withOpacity(1),
                  Color.fromARGB(230, 63, 63, 63),
                ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              AppLogo(),
              SizedBox(width: 16),
              Expanded(
                child: WelcomeText(), 
              ),
            ],
          ),
          Positioned(
            top: -8,
            right: -8,
            child: Container(
              child: IconButton(
                icon: Icon(
                  isDarkTheme ? Icons.nightlight_round : Icons.wb_sunny,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  // Trigger the ToggleTheme event
                  context.read<ThemeBloc>().add(ToggleTheme());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
