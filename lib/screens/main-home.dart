import 'package:dummyapp/constants/colors.dart';
import 'package:dummyapp/screens/player-names.dart';
import 'package:dummyapp/screens/widgets/my-button.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to TicTacToe',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 30.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            MyButton(onButtonClick: () => onSubmit(context),buttonName: 'Start Game',),
          ],
        ),
      )),
    );
  }

  void onSubmit(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PlayerNames()));
  }
}
