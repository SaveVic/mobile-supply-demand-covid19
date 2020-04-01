import 'package:flutter/material.dart';

const double borderRatio = 2;
const double paddingRatio = 3;
const double dotRatio = 5;
const double sumRatio = borderRatio + paddingRatio + dotRatio;

class CustomRadio extends StatelessWidget {
  final double dimension;
  final Color color;
  final bool isActive;

  const CustomRadio(
      {Key key,
      @required this.dimension,
      @required this.color,
      @required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      padding: EdgeInsets.all(dimension * paddingRatio / (2 * sumRatio)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: color, width: dimension * borderRatio / (2 * sumRatio)),
      ),
      child: (isActive)
          ? Container(
              width: dimension * dotRatio / sumRatio,
              height: dimension * dotRatio / sumRatio,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            )
          : Container(),
    );
  }
}
