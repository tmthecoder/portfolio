/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: project_list_item.dart

import 'package:flutter/material.dart';

class ProjectListItem extends StatelessWidget {
  final Image image;
  final Text title;
  final Text description;
  final double width;

  const ProjectListItem({Key key, this.image, this.title, this.description, this.width}) : super(key: key);

  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}