import 'package:flutter/cupertino.dart';

class TicTacToe extends ChangeNotifier {
  var _places = [2, 2, 2, 2, 2, 2, 2, 2, 2];
  var _winingPlaces = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  int _numbMatches = 1;

  int _numbDraws = 0;

  int _numbCrossWins = 0;

  int _numbCircleWins = 0;

  int get numbCircleWins => _numbCircleWins;

  set numbCircleWins(int value) {
    _numbCircleWins = value;
  }

  int get numbCrossWins => _numbCrossWins;

  set numbCrossWins(int value) {
    _numbCrossWins = value;
  }

  int get numbDraws => _numbDraws;

  set numbDraws(int value) {
    _numbDraws = value;
  }

  int get numbMatches => _numbMatches;

  set numbMatches(int value) {
    _numbMatches = value;
  }

  List get places => _places;

  set places(var value) {
    _places = value;
  }

  List get winingPlaces => _winingPlaces;

  set winingPlaces(var value) {
    _winingPlaces = value;
  }

  notify() {
    this.notifyListeners();
  }
}
