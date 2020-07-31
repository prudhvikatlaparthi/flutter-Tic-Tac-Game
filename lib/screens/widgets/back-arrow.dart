import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  final Function backArrow;
  BackArrow({
    Key key,
    @required this.backArrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: backArrow,
        ));
  }
}
