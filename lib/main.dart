import 'package:dummyapp/constants/colors.dart';
import 'package:dummyapp/model/tictactoe.dart';
import 'package:dummyapp/screens/home-screen.dart';
import 'package:dummyapp/screens/player-names.dart';
import 'package:dummyapp/screens/splash-screen.dart';
import 'package:dummyapp/screens/main-home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(primaryColor);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TicTacToe>.value(
          value: TicTacToe(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
