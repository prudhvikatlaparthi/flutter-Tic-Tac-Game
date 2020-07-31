import 'package:dummyapp/constants/colors.dart';
import 'package:dummyapp/model/tictactoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreCard extends StatelessWidget {
  final String p1Name;
  final String p2Name;

  ScoreCard({Key key, this.p1Name, this.p2Name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                '$p1Name ',
                style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 20.0,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: primaryColor)),
              child: Consumer<TicTacToe>(
                builder: (context, ticTacToe, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ticTacToe.numbCrossWins.toString(),
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 30.0,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 2.0,
                        height: 50,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ticTacToe.numbCircleWins.toString(),
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 30.0,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                ' $p2Name',
                style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 20.0,
                  color: primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
