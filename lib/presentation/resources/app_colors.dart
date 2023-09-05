import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.background,
    required this.surface,
    required this.accent,
    required this.text,
  });

  final Color background;
  final Color surface;
  final Color accent;
  final Color text;

  static const backgroundPage = Color(0xFFE5E5E5);
  static const main = Color(0xFFFF9900);
  static const grey = Color(0xFFC5C6D0);
  static const greyRoutines = Color(0xFFAFAFAF);
  static const blue = Color(0xFF00428F);
  static const greyLight = Color(0xFFF0F0F0);
  static const notInterNet = Color(0xFFE2D0B4);

  //splash
  static const mainText = Color(0xFF2A2A37);
}

const colorsLight = AppColors(
  background: Colors.white,
  surface: Colors.white,
  accent: Colors.blueAccent,
  text: Colors.black,
);

const colorsDark = AppColors(
  background: Colors.black54,
  surface: Color(0xFF222222),
  accent: Colors.lightBlueAccent,
  text: Colors.white,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
    }
  }
}
