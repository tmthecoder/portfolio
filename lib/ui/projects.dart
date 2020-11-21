/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: projects.dart

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/util/common_methods.dart';
import 'package:portfolio/util/project_status.dart';
import 'package:portfolio/util/route_controller.dart';
import 'package:portfolio/util/theme_controller.dart';
import 'package:portfolio/widgets/project_list_item.dart';

class Projects extends StatefulWidget {
  static final String route = 'projects';
  ///CreateState method
  ///Sets the state of the app (rebuilt each time a UI change is needed)
  @override
  State<StatefulWidget> createState() {
    return ProjectsState();
  }
}

class ProjectsState extends State<Projects> with WidgetsBindingObserver {
  ///InitState method
  ///Currently only sets a listener for any light/dark theme changes
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      RouteController.of(context).updateRoute("projects");
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
    // Get the width and use it to get the axis count and dynamic padding size
    double width = MediaQuery.of(context).size.width;
    double paddingSize = CommonMethods.getDynamicPaddingSize(width, width/5000/1.5);
    int axisCount = CommonMethods.getGridAxisCount(MediaQuery.of(context).size.width, paddingSize, 300);
    return Scrollbar(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(paddingSize, 20, paddingSize, 10),
            sliver: SliverStaggeredGrid.count(
              key: ObjectKey(axisCount),
              crossAxisCount: axisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: getItems(),
              staggeredTiles: List.filled(6, StaggeredTile.fit(1)),
            ),
          )
        ],
      ),
    );
  }

  /// A method to return a list with all of the items, each of which is of type
  /// [ProjectListItem] as each item will signify a different project of mine
  List<Widget> getItems() {
    return [
      ProjectListItem(
        image: AssetImage("assets/projects/crossclip/website_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png"),
        title: "CrossClip",
        description: "A secure, versatile, and seamless cross-platform clipboard manager and file transfer agent",
        projectStatus: ProjectStatus.DEVELOPMENT,
      ),
      ProjectListItem(
        image: AssetImage("assets/WebsiteLogo.png"),
        title: "dargon2",
        description: "A simple, versatile, and full-featured library for hashing in dart with the Argon2 Password Hash Algorithm",
        projectStatus: ProjectStatus.RELEASED,
      ),
      ProjectListItem(
        image: AssetImage("assets/projects/ftcscoutscore/website_logo.png"),
        title: "FTC Scouring and Scoring",
        description: "An intuitive, real-time, cloud-based Scouting and Scoring application built for ease and synchronization",
        projectStatus: ProjectStatus.RELEASED,
      ),
      ProjectListItem(
        image: AssetImage("assets/WebsiteLogo.png"),
        title: "blinkOS - A hackSugar Project",
        description: "An Android-based operating system build to ensure the user's privacy, security, and anonymity.",
        projectStatus: ProjectStatus.ALPHA,
      ),
      ProjectListItem(
        image: AssetImage("assets/WebsiteLogo.png"),
        title: "Weasel - A hackSugar Project",
        description: "An encrypted messaging client built to secure and improve upon already widespread SMS protocol.",
        projectStatus: ProjectStatus.DEVELOPMENT,
      ),
      ProjectListItem(
        image: AssetImage("assets/WebsiteLogo.png"),
        title: "TESR",
        description: "ttteehjsagd fsahdfg ashdfg  asdhgf adhkf agj ds sdf ",
        projectStatus: ProjectStatus.RELEASED,
      )
    ];
  }
}
