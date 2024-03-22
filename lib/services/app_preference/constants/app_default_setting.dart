import 'package:flutter/material.dart' show Color, Locale, immutable;
import 'package:git_search/common_setting.dart';

@immutable
class AppDefaultSettings {
  static bool get isDarkMode => GlobalSettings.isDarkMode;
  static bool get isSystemThemeMode => GlobalSettings.isSystemThemeMode;
  static Locale get locale => GlobalSettings.locale;
  static Color get colorSchemeSeed => GlobalSettings.colorSchemeSeed;
  static String? get fontFamily => GlobalSettings.fontFamily;
}
