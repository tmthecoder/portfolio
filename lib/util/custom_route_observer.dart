/// Made by Tejas Mehta
/// Made on Friday, January 01, 2021
/// File Name: custom_route_observer.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/route_controller.dart';

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {

  final GlobalKey<NavigatorState> navKey;

  CustomRouteObserver(this.navKey);

  void _sendScreenView(PageRoute<dynamic> route) {
    String screenName = route.settings.name!;
    String page = screenName.split("/").last;
    print(navKey.currentContext);
    RouteController.of(navKey.currentContext!)?.updateRoute(page);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }
}