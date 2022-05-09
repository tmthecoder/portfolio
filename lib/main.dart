import 'dart:html';

import 'package:controller_widgets/controller_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/routing/portfolio_route_information_parser.dart';
import 'package:portfolio/routing/portfolio_router_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(FutureBuilder(
    future: SharedPreferences.getInstance(),
    builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
      if (!snapshot.hasData) return Container();
      return ThemeControllerWidget(
        initiallyIsDark: window.matchMedia('(prefers-color-scheme: dark)').matches,
        child: MyApp(),
      );
    }
  ));
}

class MyApp extends StatelessWidget {
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(color: Colors.transparent, shadowColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.black)),
    textTheme: TextTheme(headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), bodyText2: TextStyle(fontSize: 16, height: 1.75)),
  );
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: Colors.transparent, shadowColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), bodyText2: TextStyle(fontSize: 16, height: 1.75, color: Colors.grey.shade200)),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Tejas Mehta',
      debugShowCheckedModeBanner: false,
      theme: ThemeController.of(context).isDark ? _darkTheme : _lightTheme,
      routeInformationParser: PortfolioRouteInformationParser(),
      routerDelegate: PortfolioRouterDelegate()
    );
  }
}
