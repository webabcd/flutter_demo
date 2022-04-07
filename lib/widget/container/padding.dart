/*
 * Padding - 内边距
 */

import 'package:flutter/material.dart';

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Padding(
            /// padding - 内边距
            ///   EdgeInsets.all(double value) - 指定所有方向的内边距
            padding: EdgeInsets.all(10),
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Padding(
            /// EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0}) - 分别指定垂直方向和水平方向的内边距
            padding: EdgeInsets.symmetric(horizontal:5, vertical: 10),
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Padding(
            /// EdgeInsets.only({this.left = 0.0, this.top = 0.0, this.right = 0.0, this.bottom = 0.0}) - 分别指定 4 个方向的内边距
            padding: EdgeInsets.only(left: 5, top: 10, right: 15, bottom: 20),
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

}