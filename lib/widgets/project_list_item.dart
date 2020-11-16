/// Made by Tejas Mehta
/// Made on Friday, November 13, 2020
/// File Name: project_list_item.dart

import 'package:flutter/material.dart';

class ProjectListItem extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final double width;

  const ProjectListItem({Key key, @required this.image, @required this.title, @required this.description, @required this.width}) : super(key: key);

  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(image: image,),
                Padding(padding: EdgeInsets.all(15),),
                Text(title, style: Theme.of(context).textTheme.headline4,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(description, style: Theme.of(context).textTheme.bodyText2,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}