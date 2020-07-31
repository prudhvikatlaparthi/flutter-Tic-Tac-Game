import 'package:dummyapp/constants/colors.dart';
import 'package:dummyapp/screens/select-icon.dart';
import 'package:dummyapp/screens/widgets/back-arrow.dart';
import 'package:dummyapp/screens/widgets/my-button.dart';
import 'package:flutter/material.dart';

class PlayerNames extends StatelessWidget {
  var player1Controller = TextEditingController();
  var player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BackArrow(
                backArrow: () => backArrowTapped(context),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Enter your names',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 30.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Player1 Name",
                          fillColor: primaryColor,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        controller: player1Controller,
                        validator: (val) {
                          if (val.length == 0) {
                            return "Field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        maxLength: 6,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) =>
                            FocusScope.of(context).nextFocus(),
                        style: new TextStyle(
                            fontFamily: 'bold',
                            fontSize: 20.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Player2 Name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        controller: player2Controller,
                        validator: (val) {
                          if (val.length == 0) {
                            return "Field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        maxLength: 6,
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                            fontFamily: 'bold',
                            fontSize: 20.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      MyButton(
                        onButtonClick: () => onSubmit(context),
                        buttonName: 'Proceed',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void onSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();

    print('player1 ${player1Controller.text}');
    print('player2 ${player2Controller.text}');
    var p1Name =
        player1Controller.text.isEmpty ? "Player1" : player1Controller.text;
    var p2Name =
        player2Controller.text.isEmpty ? "Player2" : player2Controller.text;
    // Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectIcon(p1Name: p1Name, p2Name: p2Name),
        ));
  }

  backArrowTapped(context) {
    Navigator.pop(context);
  }
}
