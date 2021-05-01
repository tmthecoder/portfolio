/// Made by Tejas Mehta
/// Made on Saturday, May 01, 2021
/// File Name: portfolio_route_information_parser.dart

import 'package:flutter/material.dart';

import 'portfolio_route_path.dart';

class PortfolioRouteInformationParser extends RouteInformationParser<PortfolioRoutePath> {
  @override
  Future<PortfolioRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return PortfolioRoutePath.about();
    }
    Uri uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) return PortfolioRoutePath.about();

    return PortfolioRoutePath(uri.path);
  }

  @override
  RouteInformation? restoreRouteInformation(PortfolioRoutePath configuration) {
    if (configuration.isUnknown) return RouteInformation(location: "/home");
    return RouteInformation(location: configuration.path);
  }

}
