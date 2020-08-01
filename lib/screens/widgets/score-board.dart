import 'package:flutter/material.dart';
import 'package:flutter_game/constants/colors.dart';
import 'package:flutter_game/model/tictactoe.dart';
import 'package:flutter_game/screens/widgets/score-card.dart';
import 'package:provider/provider.dart';

class ScoreBoard extends StatelessWidget {
  final String p1Name;
  final String p2Name;
  ScoreBoard({
    Key key,
    this.p1Name,
    this.p2Name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Consumer<TicTacToe>(builder: (context, ticTacToe, child) {
            return RichText(
              text: TextSpan(
                  text: 'Match : ',
                  style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: 25.0,
                    color: primaryColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ticTacToe.numbMatches.toString(),
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    )
                  ]),
            );
          }),
          SizedBox(
            height: 5,
          ),
          ScoreCard(p1Name: p1Name, p2Name: p2Name),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Consumer<TicTacToe>(
              builder: (context, value, child) {
                return RichText(
                  text: TextSpan(
                      text: 'Draw : ',
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 25.0,
                        color: primaryColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: value.numbDraws.toString(),
                          style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        )
                      ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
