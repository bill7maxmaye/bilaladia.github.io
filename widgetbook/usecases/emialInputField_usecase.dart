import 'package:aladia_mobile_app/features/auth/widgets/emailInputField.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

@UseCase(name: 'Custom Input Field', type: CustomInputField)
Widget customInputFieldUseCase(BuildContext context) {
  // Knob for customizing hint text
  final hintText = context.knobs.string(
    label: 'Hint Text',
    initialValue: 'Enter your text',
  );

  // Knob for customizing icon
  final icon = context.knobs.list<IconData>(
    label: 'Icon',
    options: const [
      Icons.person,
      Icons.email,
      Icons.lock,
    ],
    initialOption: Icons.person,
  );

  // Knob for input text controller
  final controller = TextEditingController(
    text: context.knobs.string(
      label: 'Input Text',
      initialValue: '',
    ),
  );

  return Center(
    child: CustomInputField(
      hintText: hintText, // Using the knob for hint text
      icon: icon, // Using the knob for icon
      controller: controller, // Using the knob for controller text
    ),
  );
}
