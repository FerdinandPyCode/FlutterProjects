import 'package:flutter/cupertino.dart';

class MyGradient extends BoxDecoration {
  MyGradient(
      {required startColor,
      required endColor,
      bool horizontal: false,
      double radius: 0})
      : super(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: FractionalOffset(0, 0),
              end: (horizontal)
                  ? FractionalOffset(1, 0)
                  : FractionalOffset(0, 1),
            ),
            borderRadius: BorderRadius.all(Radius.circular(radius)));
}
