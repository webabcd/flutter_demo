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

class FlexDemo extends StatelessWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      /// direction - 布局方向
      ///   horizontal - 水平布局
      ///   vertical - 垂直布局
      direction: Axis.horizontal,
      /// clipBehavior - 超出范围的子元素的剪裁方式（布局类 Widget 大部分都有这个属性，作用都是一样的）
      ///   none - 不剪裁
      ///   hardEdge - 裁剪但不抗锯齿，速度比 none 慢
      ///   antiAlias - 裁剪而且抗锯齿，速度比 hardEdge 慢
      ///   antiAliasWithSaveLayer - 裁剪而且抗锯齿，并分配一个缓冲区，速度比 antiAlias 慢
      clipBehavior: Clip.none,
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