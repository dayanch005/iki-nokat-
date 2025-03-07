import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    var box = Hive.box('settings');
    _isDarkMode = box.get('darkMode', defaultValue: false);
    notifyListeners();
  }

  void toggleTheme(bool isDark) {
    _isDarkMode = isDark;
    var box = Hive.box('settings');
    box.put('darkMode', isDark);
    notifyListeners();
  }
}