import 'package:flutter/material.dart';

/// Made by Tejas Mehta
/// Made on Monday, November 16, 2020
/// File Name: common_methods.dart

class CommonMethods {
  static double getDynamicPaddingSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double multiplier = MediaQuery.of(context).size.width/5000/1.5;
    return width * multiplier;
  }

  static int getGridAxisCount(double screenSize, double itemWidth) {
    return screenSize ~/ itemWidth;
  }

  static double getChildAspectRatio(int axisCount) {

  }
}