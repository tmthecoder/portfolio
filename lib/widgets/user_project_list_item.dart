/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: user_project_list_item.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/project_status.dart';
import 'package:portfolio/util/theme_controller.dart';
import 'package:portfolio/widgets/project_column.dart';

class UserProjectListItem extends StatelessWidget {
  final String linkName;
  final ImageProvider image;
  final String title;
  final String description;
  final ProjectStatus projectStatus;

  const UserProjectListItem({Key? key, required this.image, required this.title, required this.description, required this.projectStatus, required this.linkName}) : super(key: key);

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
            // onTap: () {
            //   Navigator.pushReplacementNamed(context, "/project/$linkName");
            // },
            child: ProjectColumn(image: image, title: title, description: description, projectStatus: projectStatus,)
          ),
        ),
      ),
    );
  }

}