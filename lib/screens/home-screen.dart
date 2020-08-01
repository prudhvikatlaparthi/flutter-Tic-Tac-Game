import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_game/constants/colors.dart';
import 'package:flutter_game/constants/implementations.dart';
import 'package:flutter_game/help/common-utils.dart';
import 'package:flutter_game/model/tictactoe.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import 'widgets/back-arrow.dart';
import 'widgets/row_item.dart';
import 'widgets/score-board.dart';
import 'widgets/separator.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

void showInSnackBar(String value) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content: Text(
        value,
        style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'bold'),
      )));
}

class HomeScreen extends StatefulWidget {
  final bool isCrossStart;
  final String p1Name;
  final String p2Name;

  HomeScreen({Key key, this.isCrossStart, this.p1Name, this.p2Name})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TicTacToe ticTacToe;

  // 0 - Cross , 1 - circle
  int activePlayer = 0;

  bool isCrossStarted = true;

  bool draw = false;

  BuildContext mContext;

  bool onlyOnce = true;

  bool isClickable = true;

  @override
  void initState() {
    ticTacToe = Provider.of<TicTacToe>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    activePlayer = widget.isCrossStart ? 0 : 1;
    isCrossStarted = widget.isCrossStart;
    print('Home Screen');
    mContext = context;
    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: winnerColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          BackArrow(backArrow: () => backArrowTapped(context)),
                          // Refresh(restart: restart),
                        ],
                      ),
                      ScoreBoard(p1Name: widget.p1Name, p2Name: widget.p2Name),
                      SizedBox(
                        height: 10,
                      ),
                      RowItem(
                        blockColor_1: 0XFF3C7CBF,
                        blockColor_2: 0XFF68BB6E,
                        onItemClicked: onItemClick,
                        rowPosition: 0,
                      ),
                      HorizontalSeparator(colorCode: dividerColor),
                      RowItem(
                        blockColor_1: 0XFFF08B93,
                        blockColor_2: 0XFFD11049,
                        onItemClicked: onItemClick,
                        rowPosition: 1,
                      ),
                      HorizontalSeparator(colorCode: dividerColor),
                      RowItem(
                        blockColor_1: 0XFFBACF6C,
                        blockColor_2: 0XFFF4E483,
                        onItemClicked: onItemClick,
                        rowPosition: 2,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemClick(int r, int c) {
    if (!isClickable) {
      return;
    }
    int counter = getPosition(r, c);
    if (ticTacToe.places[counter] == 2) {
      ticTacToe.places[counter] = activePlayer;
      if (activePlayer == 0) {
        activePlayer = 1;
        checkPlay();
      } else {
        activePlayer = 0;
        checkPlay();
      }
      ticTacToe.notify();
    }
  }

  void restart() {
    ticTacToe.numbMatches++;
    isCrossStarted = !isCrossStarted;
    isClickable = !isClickable;
    activePlayer = isCrossStarted ? 0 : 1;
    onlyOnce = true;
    for (int i = 0; i < ticTacToe.places.length; i++) {
      ticTacToe.places[i] = 2;
    }
    // showInSnackBar("Game Restarted");
    ticTacToe.notify();
  }

  void openDialog(title, description, src) {
    if (onlyOnce) {
      isClickable = !isClickable;
      onlyOnce = false;
      showCenterShortToast(title);
      doVibrate();
      Timer(Duration(milliseconds: 380), () {
        restart();
      });

      // showDialog(
      //   context: mContext,
      //   barrierDismissible: false,
      //   builder: (BuildContext context) => WillPopScope(
      //     onWillPop: () => null,
      //     child: CustomDialog(
      //       title: title,
      //       description: description,
      //       src: src,
      //       playAgain: playAgain,
      //       cancel: playAgain,
      //     ),
      //   ),
      // );
    }
  }

  void playAgain() {
    Navigator.pop(mContext);
    restart();
  }

  Future performTask(List win) async {
    if (ticTacToe.places[win[0]] == ticTacToe.places[win[1]] &&
        ticTacToe.places[win[1]] == ticTacToe.places[win[2]] &&
        ticTacToe.places[win[0]] != 2) {
      draw = false;
      if (ticTacToe.places[win[0]] == 0) {
        ticTacToe.places[win[0]] = 3;
        ticTacToe.places[win[1]] = 3;
        ticTacToe.places[win[2]] = 3;
        ticTacToe.numbCrossWins++;
        openDialog('${widget.p1Name} wins...', 'Congratulations...', CROSS_IMG);
      } else {
        ticTacToe.places[win[0]] = 4;
        ticTacToe.places[win[1]] = 4;
        ticTacToe.places[win[2]] = 4;
        ticTacToe.numbCircleWins++;
        openDialog(
            '${widget.p2Name} wins...', 'Congratulations...', CIRCLE_IMG);
      }
    } else {
      draw = true;
      for (int couter in ticTacToe.places) {
        some(couter);
      }
    }
  }

  void some(couter) {
    if (couter == 2) {
      draw = false;
    }
  }

  void checkPlay() async {
    draw = false;
    for (List win in ticTacToe.winingPlaces) {
      await performTask(win);
    }
    if (draw) {
      ticTacToe.numbDraws++;
      openDialog('Stalemate...', 'Lucky Game...', STALEMATE_IMG);
    }
  }

  void doVibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

  backArrowTapped(context) {
    _onBackPressed();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: dialogContent(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ));
  }

  dialogContent(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Are you sure ?', style: normalTextStyle.copyWith(fontSize: 30)),
          SizedBox(
            height: 10,
          ),
          Text('Exit the Game',
              style: normalTextStyle.copyWith(
                fontSize: 20,
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text('No',
                      style: normalTextStyle.copyWith(color: crossColor))),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes', style: normalTextStyle)),
            ],
          ),
          // SizedBox(
          //   height: 2,
          // ),
        ],
      ),
    );
  }
}
