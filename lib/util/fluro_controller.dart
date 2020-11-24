import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/about.dart';
import 'package:portfolio/ui/project_viewer.dart';
import 'package:portfolio/ui/projects.dart';

/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: fluro_controller.dart

class FluroController {
  //Setup fluro's handlers and routes
  static FluroRouter router = FluroRouter();
  static Handler _aboutHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          About());
  static Handler _projectListHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          Projects());
  static Handler _projectViewerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        ProjectViewer(projectKey: params["key"][0],)
  );

  /// A method to setup the Fluro Router and add all of the necessary routes used in this webpage
  static void setupRouter() {
    router.define("/", handler: _aboutHandler, transitionType: TransitionType.materialFullScreenDialog);
    router.define(About.route, handler: _aboutHandler, transitionType: TransitionType.materialFullScreenDialog);
    router.define(Projects.route, handler: _projectListHandler, transitionType: TransitionType.materialFullScreenDialog);
    router.define(ProjectViewer.route, handler: _projectViewerHandler, transitionType: TransitionType.materialFullScreenDialog);
  }


}