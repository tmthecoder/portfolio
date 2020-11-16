/// Made by Tejas Mehta
/// Made on Tuesday, August 25, 2020
/// File Name: projects.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/common_methods.dart';
import 'package:portfolio/util/route_controller.dart';
import 'package:portfolio/widgets/dynamic_padding.dart';
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
    double width = MediaQuery.of(context).size.width;
    double paddingSize = CommonMethods.getDynamicPaddingSize(width, width/5000/1.5);
    int axisCount = CommonMethods.getGridAxisCount(MediaQuery.of(context).size.width, paddingSize, 300);
    return Scrollbar(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(paddingSize, 0, paddingSize, 10),
            sliver: SliverGrid.count(
              childAspectRatio: CommonMethods.getChildRatioCount(axisCount, 1.15),
              crossAxisCount: axisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ProjectListItem(
                  image: AssetImage("assets/WebsiteLogo.png"),
                  title: "TESR",
                  description: "ttteehjsagd fsahdfg ashdfg  asdhgf adhkf agj ds sdf ",
                  width: 320,
                ),
                ProjectListItem(
                  image: AssetImage("assets/WebsiteLogo.png"),
                  title: "FTC Scouring and Scoring",
                  description: "ttteehjsagd fsahdfg ashdfg  asdhgf adhkf agj ds sdf ",
                  width: 320,
                ),
                ProjectListItem(
                  image: AssetImage("assets/WebsiteLogo.png"),
                  title: "Dargon2",
                  description: "ttteehjsagd fsahdfg ashdfg  asdhgf adhkf agj ds sdf ",
                  width: 320,
                ),
                ProjectListItem(
                  image: AssetImage("assets/WebsiteLogo.png"),
                  title: "TESR",
                  description: "ttteehjsagd fsahdfg ashdfg  asdhgf adhkf agj ds sdf ",
                  width: 320,
                ),
                ProjectListItem(
                  image: AssetImage("assets/WebsiteLogo.png"),
                  title: "TESR",
                  description: "ttteehjsagd fsahdfg ashdfg  asdhgf adhkf agj ds sdf ",
                  width: 320,
                ),
                ProjectListItem(
                  image: AssetImage("assets/WebsiteLogo.png"),
                  title: "TESR",
                  description: "ttteehjsagd fsahdfg ashdfg  asdhgf adhkf agj ds sdf ",
                  width: 300,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
