  
import 'package:flutter/material.dart';

class ThemeMain {
  static final _primary = Colors.yellow;
  static final _primaryDark = Colors.blue;
  static final _primaryAccent = Colors.amberAccent;
  static final _buttonColor = Colors.deepOrange;
  static final _primaryfond = Colors.orange[100];

  Color get primary {
    return _primary;
  }

  Color get primaryDark {
    return _primaryDark;
  }

  Color get primaryAccent {
    return _primaryAccent;
  }
  Color get primaryfond {
    return _primaryfond;
  }
  Color get buttonColor {
    return _buttonColor;
  }

  static setup(bool mode) {
    return ThemeData(
        colorScheme: ColorScheme(
            primary: _primary,
            primaryVariant: _primaryDark,
            secondary: _primaryDark,
            secondaryVariant: _primaryDark,
            surface: _primaryDark,
            background: _primaryDark,
            error: _primaryDark,
            onPrimary: _primaryDark,
            onSecondary: _primaryDark,
            onSurface: _primaryDark,
            onBackground: _primaryDark,
            onError: _primaryDark,
            brightness: mode ? Brightness.dark : Brightness.light),
        primaryColor: _primary,
        primaryColorDark: _primaryDark,
        buttonColor: _buttonColor,
        accentColor: _primaryAccent);
  }
}