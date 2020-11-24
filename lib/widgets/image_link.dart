/// Made by Tejas Mehta
/// Made on Tuesday, November 24, 2020
/// File Name: image_link.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/common_methods.dart';

class ImageLink extends StatelessWidget {
  final String link;
  final String assetUri;
  final EdgeInsets edgeInsets;

  const ImageLink({Key key, @required this.link, @required this.assetUri, @required this.edgeInsets}) : super(key: key);
  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: edgeInsets,
        child: Image.asset(assetUri, width: 32,),
      ),
      onTap: openLink,
    );
  }

  /// A method to open the URL given in the widget's initialization parameters
  Future<void> openLink() async {
    CommonMethods.launchUrl(link);
  }
}