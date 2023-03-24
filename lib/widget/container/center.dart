/*
 * Center - 居中对齐
 *
 * Center 继承自 Align，建议能用 Center 就别用 Align
 */

import 'package:flutter/material.dart';

class CenterDemo extends StatelessWidget {
  const CenterDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Center 的宽高与父相同
    return Center(
      /// child 相对于 Center 会居中对齐
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}