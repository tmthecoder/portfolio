/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: projects.dart

import 'dart:math';

import 'package:controller_widgets/routing/route_controller.dart';
import 'package:controller_widgets/theming/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/util/common_methods.dart';
import 'package:portfolio/util/project_status.dart';
import 'package:portfolio/widgets/developer_project_list_item.dart';
import 'package:portfolio/widgets/icon_link.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RouteController.of(context)?.updateRoute("projects");
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      RouteController.of(context)?.updateRoute("projects");
    }
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
    double paddingSize =
        CommonMethods.getDynamicPaddingSize(width, width / 5000 / 1.5);
    int axisCount = CommonMethods.getGridAxisCount(
        MediaQuery.of(context).size.width, paddingSize, 300);
    return Scrollbar(
      child: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(paddingSize, 10, paddingSize, 10),
          child: Column(
            children: [
              Text(
                "Users",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              MasonryGridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: paddingSize / 3, right: paddingSize / 3),
                physics: ClampingScrollPhysics(),
                key: UniqueKey(),
                crossAxisCount: min(axisCount, userItems.length),
                itemCount: userItems.length,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemBuilder: (context, index) => userItems[index],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                "Developers",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              MasonryGridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                key: UniqueKey(),
                crossAxisCount: axisCount,
                itemCount: developerItems.length,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemBuilder: (context, index) => developerItems[index],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// A method to return a list with all of the user items, each of which is of type
  /// [UserProjectListItem] as each item will signify a different user-oriented project of mine
  List<Widget> getUserItems() {
    return [
      //CrossClip's listing
      UserProjectListItem(
        image: AssetImage(
            "assets/projects/crossclip/website_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png"),
        title: "CrossClip",
        description:
            "A secure, versatile, and seamless cross-platform clipboard manager and file transfer agent",
        projectStatus: ProjectStatus.RELEASED,
        linkRow:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconLink(
            icon: Icons.link,
            link: "https://cclip.app",
            padding: const EdgeInsets.all(10),
          )
        ]),
      ),

      //FTC Scouting and Scoring's listing
      UserProjectListItem(
        image: AssetImage("assets/projects/ftcscoutscore/website_logo.png"),
        title: "FTC Scouring and Scoring",
        description:
            "An intuitive, real-time, cloud-based Scouting and Scoring application built for ease and synchronization",
        projectStatus: ProjectStatus.RELEASED,
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
        description:
            "A simple, versatile, and full-featured library for hashing in dart with the Argon2 Password Hash Algorithm. Contains packages for Dart Native & Flutter support",
        projectStatus: ProjectStatus.RELEASED,
        linkRow: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageLink(
              link: "https://github.com/tmthecoder/dargon2",
              assetUri:
                  "assets/third_party/github_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png",
              edgeInsets: const EdgeInsets.all(10),
            ),
            ImageLink(
              link: "https://pub.dev/packages/dargon2",
              assetUri: "assets/third_party/dart_logo.png",
              edgeInsets: const EdgeInsets.fromLTRB(10.0, 10.0, 8.0, 10.0),
            ),
            IconLink(
              icon: Icons.code,
              link: "https://docs.tmthecoder.dev/dargon2",
              padding: const EdgeInsets.all(10),
            )
          ],
        ),
        linkName: "dargon2",
      ),

      //Argon2Swift's Listing
      DeveloperProjectListItem(
        title: "Argon2Swift",
        description:
            "A Swift plugin to hash with the Argon2 Algorithm built utilizing the reference Argon2 library",
        projectStatus: ProjectStatus.RELEASED,
        linkRow: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageLink(
              link: "https://github.com/tmthecoder/Argon2Swift",
              assetUri:
                  "assets/third_party/github_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png",
              edgeInsets: const EdgeInsets.all(10),
            ),
            ImageLink(
              link: "https://cocoapods.org/pods/Argon2Swift",
              assetUri: "assets/third_party/cocoapods_logo.png",
              edgeInsets: const EdgeInsets.all(10),
            ),
            IconLink(
              icon: Icons.code,
              link: "https://docs.tmthecoder.dev/Argon2Swift",
              padding: const EdgeInsets.all(10),
            )
          ],
        ),
        linkName: "argon2swift",
      ),
      // xotp's Listing
      DeveloperProjectListItem(
          title: "xotp",
          description:
              "A Rust Crate that provides pure-rust implementations of the HOTP and TOTP algorithms",
          projectStatus: ProjectStatus.RELEASED,
          linkRow: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageLink(
                link: "https://github.com/tmthecoder/xotp",
                assetUri:
                    "assets/third_party/github_logo_${ThemeController.of(context).isDark ? "dark" : "light"}.png",
                edgeInsets: const EdgeInsets.all(10),
              ),
              ImageLink(
                link: "https://crates.io/crates/xotp",
                assetUri: "assets/third_party/cargo_logo.png",
                edgeInsets: const EdgeInsets.all(10),
              ),
              IconLink(
                icon: Icons.code,
                link: "https://docs.tmthecoder.dev/xotp",
                padding: const EdgeInsets.all(10),
              )
            ],
          ),
          linkName: "xotp"),
    ];
  }
}
