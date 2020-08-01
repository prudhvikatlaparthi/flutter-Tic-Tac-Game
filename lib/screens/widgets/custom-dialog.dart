import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/help/common-utils.dart';

class CustomDialog extends StatelessWidget {
  final String title, description;
  final String src;
  final Function playAgain;
  final Function cancel;
  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.src,
    @required this.playAgain,
    @required this.cancel,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: avatarRadius + padding,
            bottom: padding,
            left: padding,
            right: padding,
          ),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/alert.png'), fit: BoxFit.cover),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0XFF043037),
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CupertinoButton(
                    onPressed: playAgain,
                    child: Text(
                      'Play Again',
                      style: TextStyle(
                        color: Color(0XFFF4B353),
                        fontFamily: 'bold',
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    onPressed: cancel,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0XFFE1324A),
                        fontFamily: 'bold',
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: avatarRadius,
            child: Image(
              image: AssetImage(src),
              width: avatarRadius * 1.5,
              height: avatarRadius * 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
