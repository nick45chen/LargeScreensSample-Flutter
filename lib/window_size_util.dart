import 'package:flutter/material.dart';

class WindowSizeUtil {
  static WindowSize widthWindowSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 840) {
      return WindowSize.expanded;
    } else if (screenWidth > 600) {
      return WindowSize.medium;
    } else {
      return WindowSize.compact;
    }
  }

  static WindowSize heightWindowSize(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight > 900) {
      return WindowSize.expanded;
    } else if (screenHeight > 480) {
      return WindowSize.medium;
    } else {
      return WindowSize.compact;
    }
  }
}

enum WindowSize {
  compact,
  medium,
  expanded,
}
