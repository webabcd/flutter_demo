/*
 * LimitedBox - 限制最大尺寸
 */

import 'package:flutter/material.dart';

class LimitedBoxDemo extends StatelessWidget {
  const LimitedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// UnconstrainedBox 的宽高与父相同
    return UnconstrainedBox(
      /// 如果 LimitedBox 的父是无约束容器，则 LimitedBox 可以限制自己的最大宽和最大高
      child: LimitedBox(
        maxWidth: 100,
        maxHeight: 100,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}