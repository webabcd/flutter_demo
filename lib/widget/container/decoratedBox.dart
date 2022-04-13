/*
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DecoratedBoxDemo extends StatelessWidget {
  const DecoratedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors:[Colors.red,Colors.green]), //背景渐变
          borderRadius: BorderRadius.circular(3.0), //3像素圆⻆
          boxShadow: const [ //阴影
            BoxShadow(
              color:Colors.black54,
              offset: Offset(2.0,2.0),
              blurRadius: 4.0
            ),
          ],
        ),
        child: const MyText("webabcd"),
      ),
    );
  }
}