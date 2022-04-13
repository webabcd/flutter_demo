/*
 * Align - 对齐方式
 */

import 'package:flutter/material.dart';

class AlignDemo extends StatelessWidget {
  const AlignDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.blue,
          child: Align(
            /// alignment - 子相对于父的对齐方式
            ///   topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
            alignment: Alignment.topRight,
            child: Container(
              width: 40,
              height: 40,
              color: Colors.red,
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          child: Align(
            /// Alignment(x, y) - 自定义对齐方式（x, y 的取值在 -1 到 1 之间）
            ///   x=0,y=0 就是居中对齐
            ///   x=-1,y=-1 就是左上对齐
            ///   x=1,y=1 就是右下对齐
            alignment: Alignment(0, -0.8),
            /// 父的宽度为 widthFactor * 子的宽度，本例为 3 * 40 = 120
            widthFactor: 3,
            /// 父的高度为 heightFactor * 子的高度，本例为 3 * 40 = 120
            heightFactor: 3,
            child: Container(
              width: 40,
              height: 40,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}