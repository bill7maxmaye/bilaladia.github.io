import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

/// Theme Addon to switch between light and dark themes
final themeAddon = MaterialThemeAddon(
  themes: [
    WidgetbookTheme(name: 'Dark Theme', data: ThemeData.dark()),
    WidgetbookTheme(name: 'Light Theme', data: ThemeData.light()),
  ],
);

/// Device Frames Addon to test the UI on different device
final deviceFrameAddon = DeviceFrameAddon(
  devices: [
    Devices.ios.iPhone12,
    Devices.android.samsungGalaxyS20,
    Devices.ios.iPad12InchesGen2
  ],
  initialDevice: Devices.android.samsungGalaxyS20,
);
