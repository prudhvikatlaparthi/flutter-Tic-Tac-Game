import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

void showCenterShortToast(msgV) {
  Fluttertoast.showToast(
      msg: msgV,
      textColor: primaryColor,
      backgroundColor: Colors.white,
      fontSize: 20,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1);
}

var normalTextStyle = TextStyle(
    fontFamily: 'bold',
    fontSize: 20.0,
    color: primaryColor,
    fontWeight: FontWeight.bold);
