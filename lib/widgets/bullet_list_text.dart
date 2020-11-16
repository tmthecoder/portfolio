/// Made by Tejas Mehta
/// Made on Wednesday, October 21, 2020
/// File Name: bullet_list_text.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BulletListText extends StatelessWidget {
  final String text;

  const BulletListText(this.text, {Key key}) : super(key: key);
  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text("-"),
          Padding(padding: const EdgeInsets.all(5),),
          Flexible(child: Text("$text", style: TextStyle(fontSize: 14, height: 1.5),)),
        ],
      ),
    );
  }
}