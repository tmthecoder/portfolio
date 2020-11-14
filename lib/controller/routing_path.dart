import 'package:flutter/material.dart';

/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: routing_path.dart

class RoutingPath {
  final String route;
  final Function(BuildContext, String) builder;

  RoutingPath({@required this.route, @required this.builder});
}