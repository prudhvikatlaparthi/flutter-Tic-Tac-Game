import 'package:flutter/material.dart';

class CommonUtils {
  static int getPosition(int r, int c) {
    int counter = 0;
    switch (r) {
      case 0:
        {
          counter = r + c;
          break;
        }
      case 1:
        {
          counter = 2 + r + c;
          break;
        }
      case 2:
        {
          counter = 4 + r + c;
          break;
        }
    }
    return counter;
  }

  static double getWidth(context){
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    Size size = MediaQuery.of(context).size;
    if(isPortrait){
      return size.width;
    } else {
      return size.height;
    }
  }
  static double getHeight(context){
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    Size size = MediaQuery.of(context).size;
    if(isPortrait){
      return size.height;
    } else {
      return size.width;
    }
  }

  static const String CIRCLE_IMG = 'assets/cir.png';
  static const String CROSS_IMG = 'assets/cro.png';
  static const String STALEMATE_IMG = 'assets/stalemate.png';
  static const String CIRCLE_WIN_IMG = 'assets/cross_cir.png';
  static const String CROSS_WIN_IMG = 'assets/cross_cro.png';
  static const double padding = 10.0;
  static const double avatarRadius = 50.0;
}
