import 'package:flutter/material.dart';
import 'package:portfolio/ui/about.dart';
import 'package:portfolio/ui/projects.dart';
import 'package:portfolio/widgets/route_controller.dart';
import 'package:portfolio/widgets/route_controller_widget.dart';
import 'package:portfolio/widgets/theme_controller.dart';
import 'package:portfolio/widgets/theme_controller_widget.dart';

void main() {
  runApp(ThemeControllerWidget(initiallyIsDark: true, child: MyApp(),));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(color: Colors.transparent, shadowColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.black))
  );
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(color: Colors.transparent, shadowColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white))
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(context.widget);
    return RouteControllerWidget(
      initialRoute: "about",
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        title: 'Tejas Mehta',
        theme: ThemeController.of(context).isDark ? _darkTheme : _lightTheme,
        builder: (BuildContext context, Widget child) {
          print(ThemeController.of(context).isDark);
          return Navigator(
            onGenerateRoute: (_) => MaterialPageRoute(
              builder: (_) => Scaffold(
                key: _scaffoldKey,
                appBar: createAppbar(context),
                drawer: MediaQuery.of(context).size.width <= 500 ? createDrawer(context) : null,
                body: child,
              )
            ),
          );
        },
        initialRoute: '/about',
        routes: {
          '/about': (context) => About(),
          '/projects': (context) => Projects(),
        },
      ),
    );
  }

  AppBar createAppbar(BuildContext context) {
    return AppBar(
      title: Text("Tejas Mehta", style: TextStyle(color: ThemeController.of(context).isDark ? Colors.white : Colors.black),),
      actions: [
        MediaQuery.of(context).size.width > 500 ? FlatButton(
            onPressed: () => moveAndUpdateRoute("about", context, false),
            child: Text("About")
        ) : Container(),
        Padding(padding: EdgeInsets.all(10)),
        MediaQuery.of(context).size.width > 500 ? FlatButton(
            onPressed: () => moveAndUpdateRoute("projects", context, false),
            child: Text("Projects")
        ) : Container(),
        Padding(padding: EdgeInsets.all(10)),
        IconButton(
          icon: Icon(ThemeController.of(context).isDark ? Icons.wb_sunny : Icons.brightness_3), onPressed: () {
            ThemeController.of(context).toggleDark();
          })
      ],
    );
  }

  Drawer createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(title: Text("About"), onTap: () => moveAndUpdateRoute("about", context, true),),
          ListTile(title: Text("Projects"), onTap: () => moveAndUpdateRoute("projects", context, true),),
        ],
      ),
    );
  }

  void moveAndUpdateRoute(String route, BuildContext context, bool drawer) {
    if (RouteController.of(context).currentRoute != route) {
      _navigatorKey.currentState.pushNamed("/$route");
      if (drawer) _scaffoldKey.currentState.openEndDrawer();
    } else if (drawer) {
      _scaffoldKey.currentState.openEndDrawer();
    }
  }

}