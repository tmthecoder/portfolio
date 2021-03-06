/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: route_controller.dart

import 'package:flutter/cupertino.dart';

class RouteController extends InheritedWidget {

  RouteController({Key? key, required this.updateRoute, required this.currentRoute, required Widget child}) : super(key: key, child: child);

  final Function(String) updateRoute;
  final String currentRoute;

  /// The method to decide whether to notify the top-level widget on whether
  /// it needs to update the global route
  @override
  bool updateShouldNotify(RouteController oldWidget) {
    return this.currentRoute != oldWidget.currentRoute;
  }

  static RouteController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RouteController>();
  }

}