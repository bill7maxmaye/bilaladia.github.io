import 'package:aladia_mobile_app/features/auth/Bloc/theme_bloc.dart';
import 'package:aladia_mobile_app/features/auth/Bloc/theme_state.dart';
import 'package:aladia_mobile_app/features/auth/screens/loginScreen.dart';
import 'package:aladia_mobile_app/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/Bloc/splash_bloc.dart';
import 'features/splash/screens/splashScreen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData, // Apply the theme from ThemeBloc
            routes: {
              AppRoutes.splash: (context) => SplashScreen(),
              AppRoutes.login: (context) => Loginscreen(),
              //AppRoutes.home: (context) => HomeScreen(),
            },
            initialRoute: AppRoutes.login,
          );
        },
      ),
    );
  }
}
