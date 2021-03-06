import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorTheme {
  static bool isDarkMode() {
    final window = WidgetsBinding.instance?.window;
    final mode = MediaQueryData.fromWindow(window!).platformBrightness;
    return (mode == Brightness.dark);
  }

  bool isDarkModeWithContext(BuildContext context) {
    final mode = MediaQuery.of(context).platformBrightness;
    return (mode == Brightness.dark);
  }

  static Color pointer() => Colors.teal;
  static Color base() => (isDarkMode()) ? const Color.fromRGBO(33,33, 33, 1) : Colors.white;
  static Color accent() => (isDarkMode()) ? Colors.grey : Colors.grey;
  Color textColor() => (isDarkMode()) ? Colors.white: Colors.black;

}
