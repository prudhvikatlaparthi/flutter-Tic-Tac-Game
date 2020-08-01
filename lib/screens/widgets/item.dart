import 'package:flutter/material.dart';
import 'package:flutter_game/constants/colors.dart';

class Item extends StatelessWidget {
  final int flag;
  final double value;
  const Item({
    Key key,
    @required this.flag,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        flag == 1 ? 'O' : 'X',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: flag == 1 ? circleColor : crossColor,
          fontFamily: 'tic',
          // fontSize: value / 5,
          fontSize: value,
        ),
      ),
    );
  }
}
