import 'package:aladia_mobile_app/features/auth/bloc/theme_bloc.dart';
import 'package:aladia_mobile_app/features/auth/bloc/theme_state.dart';
import 'package:aladia_mobile_app/features/auth/screens/login/loginScreen.dart';
import 'package:aladia_mobile_app/features/home/screens/home_screen.dart';
import 'package:aladia_mobile_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/Bloc/splash_bloc.dart';
import 'features/splash/screens/splashScreen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            routerConfig:
                AppRouter.router, // Use the router defined in app_router.dart
          );
        },
      ),
    );
  }
}
