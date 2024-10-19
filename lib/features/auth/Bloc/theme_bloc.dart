import 'package:aladia_mobile_app/features/auth/Bloc/app_theme.dart';
import 'package:aladia_mobile_app/features/auth/Bloc/theme_event.dart';
import 'package:aladia_mobile_app/features/auth/Bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppThemes.darkTheme)) {
    // Register the event handler for ToggleTheme
    on<ToggleTheme>((event, emit) {
      // Toggle between light and dark themes
      if (state.themeData == AppThemes.lightTheme) {
        emit(ThemeState(themeData: AppThemes.darkTheme));
      } else {
        emit(ThemeState(themeData: AppThemes.lightTheme));
      }
    });
  }
}
