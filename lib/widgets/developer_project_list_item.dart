/// Made by Tejas Mehta
/// Made on Tuesday, November 24, 2020
/// File Name: developer_project_list_item.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/project_status.dart';
import 'package:portfolio/widgets/project_column.dart';

class DeveloperProjectListItem extends StatelessWidget {
  final String title;
  final String description;
  final ProjectStatus projectStatus;
  final Row? linkRow;
  final String linkName;

  const DeveloperProjectListItem({Key? key, required this.title, required this.description, required this.projectStatus, this.linkRow, required this.linkName}) : super(key: key);
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
              //   Navigator.pushNamed(context, "/project/$linkName");
              // },
              child: ProjectColumn(title: title, description: description, projectStatus: projectStatus, linkRow: linkRow,)
          ),
        ),
      ),
    );
  }
}