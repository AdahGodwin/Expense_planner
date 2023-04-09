import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  Map<String, ThemeData> _themeData;
  
  ThemeChanger(this._themeData);

 Map<String, ThemeData> getTheme() => _themeData;

  setTheme(Map<String, ThemeData> theme) {
    _themeData = theme;
    notifyListeners();
  }
}