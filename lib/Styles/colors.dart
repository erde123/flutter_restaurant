// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ThemeStyle {
  Color primary;
  Color primaryLight;
  Color primaryPastel;
  Color primaryDark;
  Color secondary;
  Color secondaryLight;
  Color secondaryPastel;

  ThemeStyle({
    required this.primary,
    required this.primaryLight,
    required this.primaryPastel,
    required this.primaryDark,
    required this.secondary,
    required this.secondaryLight,
    required this.secondaryPastel,
  });
}

int colorIndex = 0;

List<ThemeStyle> themeStyle = [
  ThemeStyle(
    primary: Color.fromARGB(255, 142, 95, 11),
    primaryLight: Color.fromARGB(255, 255, 177, 43),
    primaryPastel: Color.fromARGB(255, 237, 173, 63),
    primaryDark: Color.fromARGB(255, 142, 95, 11),
    secondary: const Color.fromARGB(255, 205, 36, 93),
    secondaryLight: const Color.fromARGB(255, 229, 72, 124),
    secondaryPastel: const Color.fromARGB(255, 255, 139, 178),
  ),
];

Color get primary {
  return themeStyle[colorIndex].primary;
}

Color get primaryPastel {
  return themeStyle[colorIndex].primaryPastel;
}

Color get primaryLight {
  return themeStyle[colorIndex].primaryLight;
}

Color get primaryDark {
  return themeStyle[colorIndex].primaryDark;
}

Color get secondary {
  return themeStyle[colorIndex].secondary;
}

Color get secondaryLight {
  return themeStyle[colorIndex].secondaryLight;
}

Color get secondaryPastel {
  return themeStyle[colorIndex].secondaryPastel;
}

Color get warning {
  return const Color.fromARGB(255, 255, 237, 77);
}

Color get danger {
  return const Color.fromARGB(255, 255, 81, 81);
}

Color get dangerSplash {
  return Color.fromARGB(255, 255, 126, 126);
}

Color get dangerDark {
  return Color.fromARGB(255, 200, 27, 27);
}

Color get safe {
  return const Color.fromARGB(255, 134, 241, 108);
}

Color get safeAlt {
  return const Color.fromARGB(255, 66, 185, 36);
}

Color get grey1 {
  return const Color.fromARGB(255, 136, 136, 136);
}

Color get grey2 {
  return const Color.fromARGB(255, 217, 217, 217);
}

Color get grey3 {
  return const Color.fromARGB(255, 247, 247, 247);
}