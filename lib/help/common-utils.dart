import 'package:flutter/material.dart';

int getPosition(int r, int c) {
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

double getWidth(context) {
  var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  Size size = MediaQuery.of(context).size;
  if (isPortrait) {
    return size.width;
  } else {
    return size.height;
  }
}

double getHeight(context) {
  var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  Size size = MediaQuery.of(context).size;
  if (isPortrait) {
    return size.height;
  } else {
    return size.width;
  }
}

const String CIRCLE_IMG = 'assets/cir.png';
const String CROSS_IMG = 'assets/cro.png';
const String STALEMATE_IMG = 'assets/stalemate.png';
const String CIRCLE_WIN_IMG = 'assets/cross_cir.png';
const String CROSS_WIN_IMG = 'assets/cross_cro.png';
const double padding = 10.0;
const double avatarRadius = 50.0;
