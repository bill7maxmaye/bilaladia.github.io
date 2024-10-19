import 'package:aladia_mobile_app/features/auth/widgets/appLogo.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default App Logo', type: AppLogo)
Widget appLogoUseCase(BuildContext context) {
  return const AppLogo(); // Display the AppLogo in its default state
}




