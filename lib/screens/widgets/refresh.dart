import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final Function restart;

  const Refresh({Key key, @required this.restart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: restart,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        alignment: Alignment.center,
        
        child: Image(
          image: AssetImage('assets/refresh.png'),
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
