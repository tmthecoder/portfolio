/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: theme_controller_widget.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeControllerWidget extends StatefulWidget {
  final bool initiallyIsDark;
  final Widget child;

  const ThemeControllerWidget({Key? key, required this.initiallyIsDark, required this.child}) : super(key: key);
  ///CreateState method
  ///Sets the state of the app (rebuilt each time a UI change is needed)
  @override
  State<StatefulWidget> createState() {
    return ThemeControllerWidgetState();
  }
}

class ThemeControllerWidgetState extends State<ThemeControllerWidget> {
  
  bool _isDark = true;

  /// A method to toggle the state if the theme and will update the website's
  /// darkmode calls
  void toggleDark() async {
    setState(() {
      _isDark = !_isDark;
    });
    (await SharedPreferences.getInstance()).setBool("initialDark", _isDark);
  }
  
  ///InitState method
  ///Currently only sets a listener for any light/dark theme changes
  @override
  void initState() {
    _isDark = widget.initiallyIsDark;
    super.initState();
  }
  
  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return ThemeController(isDark: _isDark, toggleDark: toggleDark, child: widget.child);
  }
}
