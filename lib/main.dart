import 'package:controller_widgets/controller_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/util/fluro_controller.dart';
import 'package:portfolio/ui/about.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  FluroController.setupRouter();
  runApp(FutureBuilder(
    future: SharedPreferences.getInstance(),
    builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
      if (!snapshot.hasData) return Container();
      return ThemeControllerWidget(initiallyIsDark: snapshot.data?.getBool("initialDark") ?? false, child: MyApp(),);
    }
  ));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(color: Colors.transparent, shadowColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.black)),
    textTheme: TextTheme(headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), bodyText2: TextStyle(fontSize: 16, height: 1.75)),
  );
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(color: Colors.transparent, shadowColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), bodyText2: TextStyle(fontSize: 16, height: 1.75, color: Colors.grey.shade200)),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RouteControllerWidget(
      initialRoute: "about",
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        title: 'Tejas Mehta',
        theme: ThemeController.of(context).isDark ? _darkTheme : _lightTheme,
        navigatorObservers: [CustomRouteObserver(_navigatorKey)],
        builder: (BuildContext context, Widget? child) {
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
        initialRoute: About.route,
        onGenerateRoute: FluroController.router.generator,
      ),
    );
  }

  AppBar createAppbar(BuildContext context) {
    return AppBar(
      title: Text("Tejas Mehta", style: TextStyle(color: ThemeController.of(context).isDark ? Colors.white : Colors.black),),
      actions: [
        MediaQuery.of(context).size.width > 500 ? FlatButton(
            onPressed: () => moveAndUpdateRoute("about", context, false),
            child: createTextTab("About", context)
        ) : Container(),
        Padding(padding: EdgeInsets.all(10)),
        MediaQuery.of(context).size.width > 500 ? FlatButton(
            onPressed: () => moveAndUpdateRoute("projects", context, false),
            child: createTextTab("Projects", context)
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

  Text createTextTab(String subject, BuildContext context) {
    bool isCurrent = subject.toLowerCase() == RouteController.of(context)?.currentRoute;
    if (subject.toLowerCase().contains("project") && RouteController.of(context)!.currentRoute.contains("project")) isCurrent = true;
    return Text(subject, style: isCurrent ? TextStyle(decoration: TextDecoration.underline) : null,);
  }

  void moveAndUpdateRoute(String route, BuildContext context, bool drawer) {
    if (RouteController.of(context)?.currentRoute != route) {
      _navigatorKey.currentState?.pushNamed("/$route");
      if (drawer) _scaffoldKey.currentState?.openEndDrawer();
    } else if (drawer) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }
}
