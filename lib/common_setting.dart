import 'package:flutter/material.dart' show Colors, Color, Locale;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '/services/localization/providers/localization_provider.dart';

enum AppFlavor {
  development('Development'),
  production('Production');

  final String name;
  const AppFlavor(this.name);
}

class GlobalSettings {
  static AppFlavor appFlavor = AppFlavor.production;
  static bool isDarkMode = false;
  static bool isSystemThemeMode = true;
  static Locale locale = AppLocales.enUS;
  static Color colorSchemeSeed = Colors.blueGrey;
  static String? fontFamily = GoogleFonts.ubuntu().fontFamily;
}
