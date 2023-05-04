import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  String currentLocal = "en";

  void changeTheme(ThemeMode newMode) {
    if (newMode == currentTheme) return;
    currentTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark; // true OR false
  }

  String getMainBackGround() {
    return currentTheme == ThemeMode.dark
        ? "assets/images/main_background_dark.png"
        : "assets/images/main_background.png";
  }

  void changeLanguage(String newLang) {
    if (currentLocal == newLang) return;

    currentLocal = newLang;
    notifyListeners();
  }
}
