import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';


class WelcomeTextUseCase extends StatelessWidget {
  const WelcomeTextUseCase({super.key});

  @override
  Widget build(BuildContext context) {
    // Add knobs for customization
    final String title = context.knobs.string(
      label: 'Title Text',
      initialValue: 'Welcome to Aladia,',
    );

    final String subtitle = context.knobs.string(
      label: 'Subtitle Text',
      initialValue: 'Create or access your account from here',
    );

    final Color titleColor = context.knobs.color(
      label: 'Title Color',
      initialValue: Colors.white,
    );

    final Color subtitleColor = context.knobs.color(
      label: 'Subtitle Color',
      initialValue: Colors.white.withOpacity(0.8),
    );

    final double titleFontSize = context.knobs.double.slider(
      label: 'Title Font Size',
      min: 16,
      max: 32,
      initialValue: 24,
    );

    final double subtitleFontSize = context.knobs.double.slider(
      label: 'Subtitle Font Size',
      min: 12,
      max: 24,
      initialValue: 16,
    );

    // Wrap the WelcomeText widget with Center for proper alignment
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding
        child: WelcomeText(
          title: title,
          subtitle: subtitle,
          titleColor: titleColor,
          subtitleColor: subtitleColor,
          titleFontSize: titleFontSize,
          subtitleFontSize: subtitleFontSize,
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final double titleFontSize;
  final double subtitleFontSize;

  const WelcomeText({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.titleColor,
    required this.subtitleColor,
    required this.titleFontSize,
    required this.subtitleFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: subtitleFontSize,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
}
