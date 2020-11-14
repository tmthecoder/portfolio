/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: project_viewer.dart

import 'package:flutter/material.dart';
import 'package:portfolio/controller/route_controller.dart';

class ProjectViewer extends StatefulWidget {
  static final String route = "project/:key";
  final String projectKey;

  const ProjectViewer({Key key, this.projectKey}) : super(key: key);
  ///CreateState method
  ///Sets the state of the app (rebuilt each time a UI change is needed)
  @override
  State<StatefulWidget> createState() {
    print(projectKey);
    return ProjectViewerState();
  }
}

class ProjectViewerState extends State<ProjectViewer>
    with WidgetsBindingObserver {
  ///InitState method
  ///Currently only sets a listener for any light/dark theme changes
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      RouteController.of(context).updateRoute("project/${widget.projectKey}");
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
    return Container();
  }
}
