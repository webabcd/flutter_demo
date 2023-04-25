/*
 * RotatedBox - 旋转
 *
 * RotatedBox 旋转的单位是 1/2 弧度，旋转之后再布局
 * Transform 旋转的单位是任意弧度，布局之后再旋转
 */

import 'package:flutter/material.dart';

import 'dart:math' as math;

class RotatedBoxDemo extends StatelessWidget {
  const RotatedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            /// 旋转之后再布局
            child: RotatedBox(
              quarterTurns: 1, /// 旋转的单位是 1/2 弧度
              child: Container(
                color: Colors.green,
                child: const Text('webabcd'),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            /// 布局之后再旋转
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(math.pi / 2),
              child: Container(
                color: Colors.green,
                child: const Text('webabcd'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}