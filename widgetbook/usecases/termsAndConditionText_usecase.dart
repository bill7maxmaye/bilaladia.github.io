import 'package:aladia_mobile_app/features/auth/widgets/termAndConditionText.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Text Button (Terms & Conditions)', type: TermsText)
Widget textButtonUseCase(BuildContext context) {
  return TermsText();
}
