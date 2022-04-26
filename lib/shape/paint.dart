/*
 * https://zhuanlan.zhihu.com/p/373892486
 */

import 'package:flutter/material.dart';

class PaintDemo extends StatelessWidget {
  const PaintDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}


// https://docs.flutter.dev/development/ui/layout#material-apps    materialapp  nonmaterialapp 他们继承的是什么  Material组件