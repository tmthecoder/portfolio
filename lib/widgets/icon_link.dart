/// Made by Tejas Mehta
/// Made on Wednesday, December 16, 2020
/// File Name: icon_link.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/common_methods.dart';

class IconLink extends StatelessWidget {

  final IconData icon;
  final String link;
  final EdgeInsets padding;

  const IconLink({Key key, @required this.icon, @required this.link, @required this.padding}) : super(key: key);
  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: padding,
        child: Icon(icon, size: 32,),
      ),
      onTap: _launchLink,
    );
  }

  void _launchLink() {
    CommonMethods.launchUrl(link);
  }
}