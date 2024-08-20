import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jc_music_app_flutter/Themes/dark_mode.dart';
import 'package:jc_music_app_flutter/Themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // We are setting the default to light mode
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    // Update
    _themeData = themeData;

    // Update the Dark Theme / Light Theme
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
