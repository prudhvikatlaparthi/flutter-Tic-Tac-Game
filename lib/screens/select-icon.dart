import 'package:dummyapp/constants/colors.dart';
import 'package:dummyapp/constants/implementations.dart';
import 'package:dummyapp/help/common-utils.dart';
import 'package:dummyapp/screens/home-screen.dart';
import 'package:dummyapp/screens/widgets/back-arrow.dart';
import 'package:dummyapp/screens/widgets/item.dart';
import 'package:dummyapp/screens/widgets/my-button.dart';
import 'package:flutter/material.dart';

class SelectIcon extends StatefulWidget {
  final String p1Name;
  final String p2Name;

  SelectIcon({Key key, this.p1Name, this.p2Name}) : super(key: key);

  @override
  _SelectIconState createState() => _SelectIconState();
}

class _SelectIconState extends State<SelectIcon> {
  bool isFirstSelected = false;

  bool isSecondSelected = false;

  @override
  Widget build(BuildContext context) {
    double value = CommonUtils.getWidth(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                BackArrow(
                  backArrow: () => backArrowTapped(context),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${widget.p1Name} pick your side',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 30.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFirstSelected = true;
                                  isSecondSelected = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isFirstSelected
                                      ? winnerColor
                                      : Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Item(
                                  flag: 0,
                                  value: value / 3,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFirstSelected = false;
                                  isSecondSelected = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSecondSelected
                                      ? winnerColor
                                      : Colors.transparent,
                                  borderRadius: isSecondSelected
                                      ? BorderRadius.all(Radius.circular(20))
                                      : BorderRadius.all(Radius.circular(0)),
                                ),
                                child: Item(
                                  flag: 1,
                                  value: value / 3,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      MyButton(
                        onButtonClick: () => onSubmit(context),
                        buttonName: 'Proceed',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void onSubmit(BuildContext context) {
    if (!isFirstSelected && !isSecondSelected) {
      showCenterShortToast("Please pick one");
      return;
    }
    bool isCrossStart = false;
    if (isFirstSelected) {
      isCrossStart = true;
    }
    print("Selected ${isCrossStart ? "Cross" : "circle"}");
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
              p1Name: widget.p1Name,
              p2Name: widget.p2Name,
              isCrossStart: isCrossStart),
        ));
  }

  backArrowTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
