import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'addons/addons.dart';
import 'usecases/appLogo_usecase.dart';
import 'usecases/divider_usecase.dart';
import 'usecases/emialInputField_usecase.dart';
//import 'usecases/headerCard_usecase.dart';
import 'usecases/loginPage_usecase.dart';
import 'usecases/primaryButton_usecase.dart';
import 'usecases/socialLoginButton_usecase.dart';
import 'usecases/termsAndConditionText_usecase.dart';
import 'usecases/welcomeText_usecase.dart';

void main() {
  runApp(const WidgetBook());
}

class WidgetBook extends StatelessWidget {
  const WidgetBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
        addons: [
          themeAddon,
          deviceFrameAddon,
        ], // Add any Widgetbook addons if needed
        directories: [
          WidgetbookCategory(
            name: 'UI Components',
            children: [
              WidgetbookComponent(
                name: 'Logo Components',
                useCases: [
                  WidgetbookUseCase(
                    name: 'App Logo Default',
                    builder: (context) => Center(
                      child: appLogoUseCase(context), // AppLogo use case
                    ),
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'Buttons',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Primary Button',
                    builder: (context) => Center(
                      child: primaryButtonUseCase(
                          context), // Primary Button use case
                    ),
                  ),
                  WidgetbookUseCase(
                    name: 'Social Login Button',
                    builder: (context) => Center(
                      child: socialLoginButtonUseCase(
                          context), // Social Login Button use case
                    ),
                  ),
                  WidgetbookUseCase(
                    name: 'Text Button (Terms & Conditions)',
                    builder: (context) => Center(
                      child: textButtonUseCase(context), // Text Button use case
                    ),
                  ),
                ],
              ),
              WidgetbookComponent(name: 'Text', useCases: [
                WidgetbookUseCase(
                  name: 'Welcome Text',
                  builder: (context) => Center(
                    child:
                        WelcomeTextUseCase(), // Using the WelcomeText use case
                  ),
                ),
              ]),
              WidgetbookComponent(name: 'Divide Or', useCases: [
                WidgetbookUseCase(
                  name: 'Divider Or',
                  builder: (context) =>
                      DividerOrUseCase(context), // DividerOr use case
                ),
              ]),
              WidgetbookComponent(name: 'Email Input Field', useCases: [
                WidgetbookUseCase(
                  name: 'Email Input Field',
                  builder: (context) =>
                      customInputFieldUseCase(context), // DividerOr use case
                ),
              ]),
            ],
          ),
          WidgetbookCategory(
            name: 'Login Page',
            children: [
              WidgetbookComponent(
                name: 'Login Screen',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Default Login Screen',
                    builder: (context) => Center(
                      child: loginScreenUseCase(context), // AppLogo use case
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
        initialRoute: '/Login Page/Login Screen/Default Login Screen');
  }
}
