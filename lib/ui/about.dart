/*
 * Made by Tejas Mehta
 * Made on Tuesday, August 25, 2020
 * File Name: about.dart
*/
import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/widgets/route_controller.dart';
import 'dart:ui' as ui;

class About extends StatefulWidget {
  ///CreateState method
  ///Sets the state of the app (rebuilt each time a UI change is needed)
  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<About> with WidgetsBindingObserver {
  ///InitState method
  ///Currently only sets a listener for any light/dark theme changes
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      RouteController.of(context).updateRoute("about");
    });
    WidgetsBinding.instance.addObserver(this);

  }


  ///Dispose method
  ///Currently only removes the observer set in initState for the light/dark theme changes
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ///didChangePlatformBrightness method
  ///Only changes the listener's state to the theme allowing to change the theme while user is on the screen
  @override
  void didChangePlatformBrightness() {
    WidgetsBinding.instance.window.platformBrightness;
  }


  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RaisedButton(
          onPressed: callJS,
          child: Text("Pay with Stripe"),
        ),
      ],
    );
  }

  void callJS() {
    js.context.callMethod('createAndRedirect', ["price_1HLJr5Ge8QXeWO1XzL92REy5"]);
  }
}
