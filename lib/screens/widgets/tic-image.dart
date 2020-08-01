import 'package:flutter/material.dart';
import 'package:flutter_game/help/common-utils.dart';
import 'package:flutter_game/model/tictactoe.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class TicImage extends StatelessWidget {
  final String src;
  final Function itemClicked;
  final int rowPosition;
  final int columnPosition;
  // final TicTacToe ticTacToe;
  const TicImage(
      {Key key,
      this.src,
      this.itemClicked,
      this.rowPosition,
      this.columnPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TicTacToe ticTacToe = Provider.of<TicTacToe>(context);
    double value = getWidth(context);
    int position = getPosition(rowPosition, columnPosition);
    // print('ti-image $rowPosition $columnPosition');
    return GestureDetector(
        onTap: () => itemClicked(rowPosition, columnPosition),
        child: Consumer<TicTacToe>(
          builder: (context, ticTacToe, child) {
            return Container(
                alignment: Alignment.center,
                width: value / 4,
                height: value / 4,
                decoration: BoxDecoration(
                    color: ticTacToe.places[position] == 3 ||
                            ticTacToe.places[position] == 4
                        ? Colors.white
                        : ticTacToe.places[position] == 2
                            ? Colors.transparent
                            : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ticTacToe.places[position] == 1 ||
                        ticTacToe.places[position] == 4
                    ? Item(
                        flag: 1,
                        value: value / 5,
                      )
                    : ticTacToe.places[position] == 0 ||
                            ticTacToe.places[position] == 3
                        ? Item(
                            flag: 0,
                            value: value / 5,
                          )
                        : SizedBox.shrink());
          },
        ));
  }
}

// class ActualImage extends StatelessWidget {
//   final String src;
//   final double size;
//   const ActualImage({
//     Key key,
//     this.src,
//     this.size,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image(image: AssetImage(src), width: 10, height: 10);
//   }
// }
