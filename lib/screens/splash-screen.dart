import 'dart:async';

import 'package:dummyapp/constants/implementations.dart';
import 'package:dummyapp/help/common-utils.dart';
import 'package:dummyapp/screens/widgets/item.dart';
import 'package:dummyapp/screens/main-home.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  String version;

  void navigationPage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainHomePage()));
  }

  @override
  void initState() {
    super.initState();
    getVersionName();
    // startTime();
  }

  @override
  Widget build(BuildContext context) {
    double value = CommonUtils.getWidth(context);
    return new Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Item(
                flag: 0,
                value: value / 4,
              ),
              SizedBox(
                width: 10,
              ),
              Item(
                flag: 1,
                value: value / 4,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'TicTacToe',
            style: normalTextStyle.copyWith(fontSize: 40),
          ),
          SizedBox(
            height: 10,
          ),
          if (version != null)
            Text(
              'Version: $version',
              style: normalTextStyle.copyWith(fontSize: 20),
            )
        ],
      )),
    );
  }

  Future<void> getVersionName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
    startTime();
  }
}
