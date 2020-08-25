import 'package:flutter/material.dart';
import 'package:portfolio/ui/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _isDark = true;
  ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
  );
  ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(
        title: 'Tejas Mehta',
        theme: _isDark ? _darkTheme : _lightTheme,
        builder: (BuildContext context, Widget child) {
          print(MediaQuery.of(context).size.width);
          return Scaffold(
            appBar: AppBar(
              title: Text("Tejas Mehta"),
//              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//              shadowColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                MediaQuery.of(context).size.width > 500 ? FlatButton(
                    onPressed: () {},
                    child: Text("About")
                ) : Container(),
                Padding(padding: EdgeInsets.all(10)),
                MediaQuery.of(context).size.width > 500 ? FlatButton(
                    onPressed: () {},
                    child: Text("Projects")
                ) : Container(),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
            drawer: MediaQuery.of(context).size.width <= 500 ? Drawer(
              child: ListView(
                children: [
                  ListTile(title: Text("About"),),
                  ListTile(title: Text("Projects"),),
                ],
              ),
            ) : null,
            body: child,
          );
        },
        home: Homepage(),
      ),
    );
  }
}