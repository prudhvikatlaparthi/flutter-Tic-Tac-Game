import 'package:flutter/material.dart';
import 'package:flutter_game/constants/colors.dart';
import 'package:flutter_game/screens/widgets/separator.dart';

import 'tic-image.dart';

class RowItem extends StatelessWidget {
  final int blockColor_1;
  final int blockColor_2;
  final String src1;
  final String src2;
  final String src3;
  final Function onItemClicked;
  final int rowPosition;
  RowItem(
      {this.blockColor_1,
      this.blockColor_2,
      this.src1,
      this.src2,
      this.src3,
      this.onItemClicked,
      this.rowPosition});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TicImage(
          src: src1,
          itemClicked: onItemClicked,
          rowPosition: rowPosition,
          columnPosition: 0,
        ),
        VerticalSeparator(color: dividerColor),
        TicImage(
          src: src2,
          itemClicked: onItemClicked,
          rowPosition: rowPosition,
          columnPosition: 1,
        ),
        VerticalSeparator(color: dividerColor),
        TicImage(
          src: src3,
          itemClicked: onItemClicked,
          rowPosition: rowPosition,
          columnPosition: 2,
        ),
      ],
    );
  }
}
