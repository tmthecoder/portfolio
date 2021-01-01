/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: route_controller_widget.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/route_controller.dart';

class RouteControllerWidget extends StatefulWidget {
  final String initialRoute;
  final Widget child;

  const RouteControllerWidget({Key key, this.initialRoute, this.child}) : super(key: key);
  ///CreateState method
  ///Sets the state of the app (rebuilt each time a UI change is needed)
  @override
  State<StatefulWidget> createState() {
    return RouteControllerWidgetState();
  }
}

class RouteControllerWidgetState extends State<RouteControllerWidget>
    with WidgetsBindingObserver {

  String _route = "";

  /// A method to update the current route for the website and updates the called route
  void updateRoute(String route) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _route = route;
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
    return RouteController(
      updateRoute: updateRoute,
      currentRoute: _route,
      child: widget.child,
    );
  }
}
