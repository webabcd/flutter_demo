/*
 * FractionallySizedBox - 按比值占用可用空间
 */

import 'package:flutter/material.dart';

class FractionallySizedBoxDemo extends StatelessWidget {
  const FractionallySizedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: FractionallySizedBox(
        /// 实际宽度：可用宽度 * 0.5
        widthFactor: 0.5,
        /// 实际高度：可用高度 * 0.5
        heightFactor: 0.5,
        /// 子的对齐方式
        alignment: FractionalOffset.center,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}