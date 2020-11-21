/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: project_list_item.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/project_status.dart';
import 'package:portfolio/util/theme_controller.dart';

class ProjectListItem extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final ProjectStatus projectStatus;

  const ProjectListItem({Key key, @required this.image, @required this.title, @required this.description, @required this.projectStatus}) : super(key: key);

  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(10),),
                Image(image: image,),
                Padding(padding: EdgeInsets.all(15),),
                Text(title, style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.bold)), textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(description, style: Theme.of(context).textTheme.bodyText2,),
                ),
                buildProjectStatus(context),
                Padding(padding: const EdgeInsets.all(10)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
                    child: Text("More Details...", textAlign: TextAlign.right, style: TextStyle(color: ThemeController.of(context).isDark ? Colors.grey[400] : Colors.grey[700], fontSize: 14),),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// A method to translate the projectStatus enum given into a readable string
  /// paired with its respective color: Green for released, Yellow for beta,
  /// Orange for alpha, and Red for in-development
  Widget buildProjectStatus(BuildContext context) {
    Color color = Colors.green;
    String projectString = "";
    switch (projectStatus) {
      case ProjectStatus.RELEASED:
        color = Colors.green;
        projectString = "Released!";
        break;
      case ProjectStatus.BETA:
        color = Colors.yellow;
        projectString = "In Beta";
        break;
      case ProjectStatus.ALPHA:
        color = Colors.orange;
        projectString = "In Alpha";
        break;
      case ProjectStatus.DEVELOPMENT:
        color = Colors.red;
        projectString = "In Development";
        break;
    }
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Project Status: ",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          TextSpan(
            text: projectString,
            style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: color))
          )
        ]
      ),
    );
  }
}