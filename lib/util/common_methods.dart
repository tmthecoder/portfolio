import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Made by Tejas Mehta
/// Made on Monday, November 16, 2020
/// File Name: common_methods.dart

class CommonMethods {

  /// A method to get the dynamic padding size given a width and multiplier
  static double getDynamicPaddingSize(double screenWidth, double multiplier) {
    return screenWidth * multiplier;
  }

  /// A method to get the axis count on a grid view given the padding on both sides,
  /// the screen's width, and each singular item's width
  static int getGridAxisCount(double screenWidth, double rlPadding, double itemWidth) {
    if (screenWidth <= itemWidth + rlPadding*2) {
      return 1;
    }
    return (screenWidth - rlPadding * 2) ~/ itemWidth;
  }

  /// A method to launch a given url using the url_launcher plugin
  static Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}