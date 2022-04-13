/*
 * UnconstrainedBox - 无约束（让子元素自行决定宽高）
 */

import 'package:flutter/material.dart';

class UnconstrainedBoxDemo extends StatelessWidget {
  const UnconstrainedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 屏幕会强制 UnconstrainedBox 的宽高与屏幕相同
    /// UnconstrainedBox 会让其子元素自行决定宽高，如果超过了 UnconstrainedBox 的宽高则会有内容溢出的警告
    return UnconstrainedBox(
      /// alignment - 子相对于父的对齐方式
      ///   topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
      alignment: Alignment.bottomRight,
      /// constrainedAxis - 例外
      ///   null - 无例外，默认值
      ///   Axis.horizontal - 水平方向例外，也就是说水平方向不能自行决定大小，需要受到 UnconstrainedBox 的父的约束
      ///   Axis.vertical - 垂直方向例外，也就是说垂直方向不能自行决定大小，需要受到 UnconstrainedBox 的父的约束
      constrainedAxis: null,
      /// 结果 Container 的宽为 50，高为 50，位置在屏幕的右下角
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}