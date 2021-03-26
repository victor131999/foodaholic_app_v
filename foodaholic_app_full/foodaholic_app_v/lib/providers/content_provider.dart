import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  bool _darkMode = false;
   String _token = "";

  int get selectedIndex {
    return _selectedIndex;
  }

  set selectedIndex(int value) {
    this._selectedIndex = value;
    notifyListeners();
  }

  bool get darkMode {
    return this._darkMode;
  }

  set darkMode(bool value) {
    this._darkMode = value;
    notifyListeners();
  }

  initDarkMode(bool value, String token) {
    this._darkMode = value;
    this._token = token;
  }

  String get token {
    return this._token;
  }

  set token(String value) {
    this._token = value;
    notifyListeners();
  }

}