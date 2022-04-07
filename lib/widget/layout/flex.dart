/*
 * Flex - 水平布局或垂直布局
 *   Expanded - 容器 widget，只能在 Flex 中使用，用于指定占用空间的权重
 *   Spacer - 空白 widget，只能在 Flex 中使用，用于指定占用空间的权重
 *
 * Row 和 Column 都继承自 Flex，大家的用法都是差不多的，本例主要演示 Flex 中 Expanded, Spacer 的用法
 * 在 Row 或 Column 中使用 Expanded, Spacer 请参考本例即可
 * 实际开发中，建议能用 Row 或 Column 就别用 Flex
 */

import 'package:flutter/material.dart';

class FlexDemo extends StatefulWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  _FlexDemoState createState() => _FlexDemoState();
}

class _FlexDemoState extends State<FlexDemo> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      /// direction - 布局方向
      ///   horizontal - 水平布局
      ///   vertical - 垂直布局
      direction: Axis.horizontal,
      children: [
        Container(
          width: 20,
          height: 20,
          color: Colors.red,
        ),
        /// Expanded - 容器 widget，只能在 Flex 中使用
        ///   flex - 占用空间的权重，默认值为 1
        Expanded(
          flex: 1,
          child: Container(
            height: 20,
            color: Colors.green,
          ),
        ),
        /// Spacer - 空白 widget，只能在 Flex 中使用
        ///   flex - 占用空间的权重，默认值为 1
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 20,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}