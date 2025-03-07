import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  bool _isDarkMode = false;
  Locale _locale = Locale('tm'); 

  bool get isDarkMode => _isDarkMode;
  Locale get locale => _locale;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void changeLanguage(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
