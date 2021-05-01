/// Made by Tejas Mehta
/// Made on Saturday, May 01, 2021
/// File Name: portfolio_route_controller_widget.dart

import 'package:flutter/material.dart';

import 'portfolio_route_controller.dart';
import 'portfolio_route_path.dart';

class PortfolioRouteControllerWidget extends StatefulWidget {
  final String initialRoute;
  final Widget child;
  final RouterDelegate delegate;

  const PortfolioRouteControllerWidget({Key? key, required this.initialRoute, required this.child, required this.delegate}) : super(key: key);
  ///CreateState method
  ///Sets the state of the app (rebuilt each time a UI change is needed)
  @override
  State<StatefulWidget> createState() {
    return PortfolioRouteControllerWidgetState();
  }
}

class PortfolioRouteControllerWidgetState extends State<PortfolioRouteControllerWidget>
    with WidgetsBindingObserver {

  String _route = "";

  /// A method to update the current route for the website and updates the called route
  void updateRoute(PortfolioRoutePath path) {
    widget.delegate.setNewRoutePath(path);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _route = path.path;
      });
    });
  }

  ///InitState method
  ///Currently only sets a listener for any light/dark theme changes
  @override
  void initState() {
    super.initState();
    _route = widget.initialRoute;
  }

  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return PortfolioRouteController(
      updateRoute: updateRoute,
      currentRoute: _route,
      child: widget.child,
    );
  }
}
