/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: user_project_list_item.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/project_status.dart';
import 'package:portfolio/widgets/project_column.dart';

class UserProjectListItem extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final ProjectStatus projectStatus;
  final Row? linkRow;

  const UserProjectListItem({Key? key, required this.image, required this.title, required this.description, required this.projectStatus, this.linkRow}) : super(key: key);

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
          child: ProjectColumn(image: image, title: title, description: description, projectStatus: projectStatus, linkRow: linkRow,),
        ),
      ),
    );
  }

}
