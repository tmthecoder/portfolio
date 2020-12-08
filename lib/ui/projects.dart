/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: projects.dart

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/util/common_methods.dart';
import 'package:portfolio/util/project_status.dart';
import 'package:portfolio/util/route_controller.dart';
import 'package:portfolio/util/theme_controller.dart';
import 'package:portfolio/widgets/developer_project_list_item.dart';
import 'package:portfolio/widgets/image_link.dart';
import 'package:portfolio/widgets/user_project_list_item.dart';

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
    //Get both item lists
    List<Widget> userItems = getUserItems();
    List<Widget> developerItems = getDeveloperItems();
    //Get the width and use it to get the axis count and dynamic padding size
    double width = MediaQuery.of(context).size.width;
    double paddingSize = CommonMethods.getDynamicPaddingSize(width, width/5000/1.5);
    int axisCount = CommonMethods.getGridAxisCount(MediaQuery.of(context).size.width, paddingSize, 300);
    return Scrollbar(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(paddingSize, 10, paddingSize, 10),
            sliver: SliverToBoxAdapter(
              child: Text("Users", style: Theme.of(context).textTheme.headline4,),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(paddingSize, 10, paddingSize, 10),
            sliver: SliverStaggeredGrid.count(
              key: ObjectKey(axisCount),
              crossAxisCount: axisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: userItems,
              staggeredTiles: List.filled(userItems.length, StaggeredTile.fit(1)),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(paddingSize, 10, paddingSize, 10),
            sliver: SliverToBoxAdapter(
              child: Text("Developers", style: Theme.of(context).textTheme.headline4,),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(paddingSize, 10, paddingSize, 10),
            sliver: SliverStaggeredGrid.count(
              key: ObjectKey(axisCount),
              crossAxisCount: axisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: developerItems,
              staggeredTiles: List.filled(developerItems.length, StaggeredTile.fit(1)),
            ),
          )
        ],
      ),
    );
  }

  /// A method to return a list with all of the user items, each of which is of type
  /// [UserProjectListItem] as each item will signify a different user-oriented project of mine
  List<Widget> getUserItems() {
    return [
      //CrossClip's listing
      UserProjectListItem(
        image: AssetImage("assets/projects/crossclip/website_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png"),
        title: "CrossClip",
        description: "A secure, versatile, and seamless cross-platform clipboard manager and file transfer agent",
        projectStatus: ProjectStatus.DEVELOPMENT,
      ),

      //FTC Scouting and Scoring's listing
      UserProjectListItem(
        image: AssetImage("assets/projects/ftcscoutscore/website_logo.png"),
        title: "FTC Scouring and Scoring",
        description: "An intuitive, real-time, cloud-based Scouting and Scoring application built for ease and synchronization",
        projectStatus: ProjectStatus.RELEASED,
      ),

      //blinkOS's listing
      UserProjectListItem(
        image: AssetImage("assets/projects/blinkos/website_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png"),
        title: "blinkOS - A hackSugar Project",
        description: "An Android-based operating system build to ensure the user's privacy, security, and anonymity.",
        projectStatus: ProjectStatus.ALPHA,
      ),

      //Weasel's listing
      UserProjectListItem(
        image: AssetImage("assets/projects/weasel/website_logo.png"),
        title: "Weasel - A hackSugar Project",
        description: "An encrypted messaging client built to secure and improve upon the already widespread SMS protocol.",
        projectStatus: ProjectStatus.DEVELOPMENT,
      ),
    ];
  }

  /// A method to return a list with all of the developer items, each of which is of type
  /// [DeveloperProjectListItem] as each item will signify a different developer-oriented project of mine
  List<Widget> getDeveloperItems() {
    return [
      //dargon2's listing
      DeveloperProjectListItem(
        title: "dargon2",
        description: "A simple, versatile, and full-featured library for hashing in dart with the Argon2 Password Hash Algorithm",
        projectStatus: ProjectStatus.RELEASED,
        linkRow: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageLink(
              link: "https://github.com/tmthecoder/dargon2",
              assetUri: "assets/third_party/github_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png",
              edgeInsets: const EdgeInsets.all(10),
            ),
            ImageLink(
              link: "https://pub.dev/packages/dargon2",
              assetUri: "assets/third_party/dart_logo.png",
              edgeInsets: const EdgeInsets.fromLTRB(10.0, 10.0, 8.0, 10.0),
            ),
          ],
        ),
      ),

      //dargon2_fluter's Listing
      DeveloperProjectListItem(
        title: "dargon2_flutter",
        description: "A Flutter plugin to hash with the Argon2 Algorithm, with the same usage mechanisms as dargon2",
        projectStatus: ProjectStatus.RELEASED,
        linkRow: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageLink(
              link: "https://github.com/tmthecoder/dargon2_flutter",
              assetUri: "assets/third_party/github_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png",
              edgeInsets: const EdgeInsets.all(10),
            ),
          ],
        ),
      ),
      
      //OdometryCore's Listing
      DeveloperProjectListItem(
        title: "Odometry Core",
        description: "A library that houses and abstracts the core algorithm for three-encoder robot motion tracking",
        projectStatus: ProjectStatus.RELEASED,
        linkRow: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageLink(
              link: "https://github.com/tmthecoder/OdometryCore",
              assetUri: "assets/third_party/github_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png",
              edgeInsets: const EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    ];
  }

}
