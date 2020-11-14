/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: project_list_item.dart

import 'package:flutter/material.dart';

class ProjectListItem extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
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
              Image(image: image, width: width,),
              Padding(padding: EdgeInsets.all(5),),
              Text(title, style: Theme.of(context).textTheme.headline4,),
              Padding(padding: EdgeInsets.all(5),),
              Text(description, style: Theme.of(context).textTheme.bodyText2,)
            ],
          ),
        ),
      ),
    );
  }
}