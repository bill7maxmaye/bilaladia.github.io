import 'package:aladia_mobile_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/splash_bloc.dart';
import '../Bloc/splash_event.dart';
import '../Bloc/splash_state.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch the SplashStarted event when the screen initializes
    context.read<SplashBloc>().add(SplashStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFD700),
                Color(0xFF000000), // BlackR
                //Color(0xFFFFFFFF), // White
                Color.fromARGB(255, 137, 124, 1),
                //Color(0xFF000000), // Gold
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.5, 0.0], // Black -> White -> Gold stops
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/bg.CxZW_qGj.gif',
              width: 250, // Adjust the width according to the design
            ),
          ),
        ),
      ),
    );
  }
}
