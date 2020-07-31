import 'package:dummyapp/constants/dimens.dart';
import 'package:dummyapp/help/common-utils.dart';
import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({
    Key key,
    @required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    double value = CommonUtils.getWidth(context);
    // print('size $value');
    return Container(
      width: separatorWidth,
      height: value * 0.3,
      color: color,
    );
  }
}

class HorizontalSeparator extends StatelessWidget {
  final Color colorCode;
  const HorizontalSeparator({
    Key key,
    this.colorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double value = CommonUtils.getWidth(context);
    return Container(
      width: value *0.85,
      height: separatorWidth,
      color: colorCode,
    );
  }
}
