/// Made by Tejas Mehta
/// Made on Saturday, May 01, 2021
/// File Name: portfolio_router_delegate.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:controller_widgets/controller_widgets.dart';
import 'package:portfolio/ui/about.dart';
import 'package:portfolio/ui/projects.dart';

import 'portfolio_route_controller_widget.dart';
import 'portfolio_route_path.dart';

class PortfolioRouterDelegate extends RouterDelegate<PortfolioRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PortfolioRoutePath> {

  static Uri _currentPage = Uri.parse("");

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  PortfolioRoutePath? get currentConfiguration {
    if (!PortfolioRoutePath.paths.contains(_currentPage.path))
      return PortfolioRoutePath.about();

    return PortfolioRoutePath(_currentPage.path);
  }

  @override
  Widget build(BuildContext context) {
    return PortfolioRouteControllerWidget(
      initialRoute: _currentPage.path,
      delegate: this,
      child: Overlay(
        initialEntries: [
          OverlayEntry(builder: (context) => Scaffold(
            key: _scaffoldKey,
            appBar: _createAppbar(context),
            drawer: MediaQuery.of(context).size.width <= 500 ? _createDrawer(context) : null,
            body: Navigator(
              key: navigatorKey,
              pages: [
                _getPathForRoute(_currentPage)
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) return false;
                _currentPage.removeFragment();
                notifyListeners();
                return true;
              },
            ),
          ))
        ],
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(PortfolioRoutePath path) async {
    if (path.isUnknown) {
      _currentPage = Uri.parse("/about");
    } else {
      _currentPage = Uri.parse(path.path);
    }
    notifyListeners();
  }

  MaterialPage _getPathForRoute(Uri route) {
    switch (route.path) {
      case "/about":
        return MaterialPage(child: About());
      case "/projects":
        return MaterialPage(child: Projects());
      default:
        return MaterialPage(child: About());
    }
  }

  AppBar _createAppbar(BuildContext context) {
    return AppBar(
      title: Text("Tejas Mehta", style: TextStyle(color: ThemeController.of(context).isDark ? Colors.white : Colors.black),),
      actions: [
        MediaQuery.of(context).size.width > 500 ? TextButton(
            onPressed: () => moveAndUpdateRoute(PortfolioRoutePath.about(), false),
            child: _createTextTab("About", context)
        ) : Container(),
        Padding(padding: EdgeInsets.all(10)),
        MediaQuery.of(context).size.width > 500 ? TextButton(
            onPressed: () => moveAndUpdateRoute(PortfolioRoutePath.projects(), false),
            child: _createTextTab("Projects", context)
        ) : Container(),
        Padding(padding: EdgeInsets.all(10)),
        IconButton(
            icon: Icon(ThemeController.of(context).isDark ? Icons.wb_sunny : Icons.brightness_3), onPressed: () {
          ThemeController.of(context).toggleDark();
        })
      ],
    );
  }

  Drawer _createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(title: Text("About"), onTap: () => moveAndUpdateRoute(PortfolioRoutePath.about(), true),),
          ListTile(title: Text("Projects"), onTap: () => moveAndUpdateRoute(PortfolioRoutePath.projects(), true),),
        ],
      ),
    );
  }

  Text _createTextTab(String subject, BuildContext context) {
    TextStyle buttonStyle = TextStyle(
      color: ThemeController.of(context).isDark ? Colors.white : Colors.black,
    );
    bool isCurrent = subject.toLowerCase() == _currentPage.path.replaceAll("/", "");
    if (subject.toLowerCase().contains("about") && _currentPage.path.replaceAll("/", "") == "") isCurrent = true;
    // if (subject.toLowerCase().contains("project") && RouteController.of(context)!.currentRoute.contains("project")) isCurrent = true;
    return Text(subject, style: isCurrent ? buttonStyle.merge(TextStyle(decoration: TextDecoration.underline)) : buttonStyle,);
  }

  //
  // void moveAndUpdateRoute(CrossClipRoutePath path) {
  //   setNewRoutePath(path);
  // }

  void moveAndUpdateRoute(PortfolioRoutePath path, bool drawer) {
    setNewRoutePath(path);
    if (drawer) _scaffoldKey.currentState?.openEndDrawer();
  }

}
