/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: theme_controller_widget.dart

import 'package:flutter/material.dart';

class ThemeController extends InheritedWidget {
  ThemeController({Key? key, required this.isDark, required this.toggleDark, required Widget child}) : super(key: key, child: child);

  final bool isDark;
  final Function toggleDark;

  /// The method to decide whether any update should notify the parent widget to change the theme
  @override
  bool updateShouldNotify(ThemeController oldWidget) {
    return isDark != oldWidget.isDark;
  }

  /// The static getter to get the current state of the theme
  static ThemeController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeController>()!;
  }
}