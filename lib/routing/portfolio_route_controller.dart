/// Made by Tejas Mehta
/// Made on Saturday, May 01, 2021
/// File Name: portfolio_route_controller.dart

import 'package:flutter/material.dart';
import 'portfolio_route_path.dart';

class PortfolioRouteController extends InheritedWidget {

  PortfolioRouteController({Key? key, required this.updateRoute, required this.currentRoute, required Widget child}) : super(key: key, child: child);

  final Function(PortfolioRoutePath) updateRoute;
  final String currentRoute;

  /// The method to decide whether to notify the top-level widget on whether
  /// it needs to update the global route
  @override
  bool updateShouldNotify(PortfolioRouteController oldWidget) {
    return this.currentRoute != oldWidget.currentRoute;
  }

  static PortfolioRouteController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PortfolioRouteController>();
  }

}
