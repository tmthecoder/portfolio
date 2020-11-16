import 'package:flutter/material.dart';

/// Made by Tejas Mehta
/// Made on Monday, November 16, 2020
/// File Name: common_methods.dart

class CommonMethods {
  static double getDynamicPaddingSize(double screenWidth, double multiplier) {
    return screenWidth * multiplier;
  }

  static int getGridAxisCount(double screenWidth, double rlPadding, double itemWidth) {
    if (screenWidth <= itemWidth + rlPadding*2) {
      return 1;
    }
    return (screenWidth - rlPadding * 2) ~/ itemWidth;
  }

  static double getChildRatioCount(int axisCount, double singleRatio) {
    return singleRatio - 0.1 * axisCount;
  }
}