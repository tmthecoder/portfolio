/// Made by Tejas Mehta
/// Made on Saturday, November 14, 2020
/// File Name: dynamic_padding.dart

import 'package:flutter/material.dart';
import 'package:portfolio/util/common_methods.dart';

class DynamicPadding extends StatelessWidget {
  final Widget child;
  const DynamicPadding({Key? key, required this.child}) : super(key: key);
  ///Main widget build method
  ///Builds the UI on this screen
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(CommonMethods.getDynamicPaddingSize(width, width/5000/1.5), 20,  CommonMethods.getDynamicPaddingSize(width, width/5000/1.5), 50),
      child: child,
    );
  }
}