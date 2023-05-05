/*
 * Flex - 水平弹性布局或垂直弹性布局
 *   Expanded - 容器 widget，只能在 Flex 中使用，用于指定占用空间的权重
 *     以 Row 为例，Expanded 会强制其子元素与 Expanded 同宽
 *   Flexible - 容器 widget，只能在 Flex 中使用，用于指定占用空间的权重
 *     以 Row 为例，Flexible 会让其子元素自行决定宽度，然后调整为与其子元素同宽，但是宽度不能超过 Flexible 的 flex 指定的权重
 *   Spacer - 空白 widget，只能在 Flex 中使用，用于指定占用空间的权重
 *
 * Row 和 Column 都继承自 Flex，大家的用法都是差不多的，本例主要演示 Flex 中弹性布局 Expanded, Flexible, Spacer 的用法
 * 在 Row 或 Column 中使用 Expanded, Flexible, Spacer 请参考本例即可
 * 实际开发中，建议能用 Row 或 Column 就别用 Flex（但是如果需求是，能在水平弹性布局和垂直弹性布局之间随其切换，则用 Flex 比较好）
 *
 * 注：Expanded, Flexible, Spacer 只能应用于类似 Flex/Row/Column 这种弹性布局控件
 */

import 'package:flutter/material.dart';

class FlexDemo extends StatelessWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flex(
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
        ),

        Flex(
          direction: Axis.horizontal,
          children: [
            /// 下面的 Container 的宽度设置是无效的
            /// Expanded 会占用屏幕 1/3 的宽度，其会强制其子 Container 与 Expanded 同宽
            Expanded(
              child: Container(
                width: 50,
                height: 20,
                color: Colors.red,
              ),
            ),
            /// 下面的 Container 的宽度设置是有效的，但是不能超过 Flexible 的 flex 指定的权重（本例中就是屏幕 1/3 的宽度）
            /// 结果是 Flexible 和 Container 都是 50 的宽度
            Flexible(
              child: Container(
                width: 50,
                height: 20,
                color: Colors.green,
              ),
            ),
            /// 下面的 Container 的宽度设置是有效的，但是不能超过 Flexible 的 flex 指定的权重（本例中就是屏幕 1/3 的宽度）
            /// 结果是 Flexible 和 Container 都是 50 的宽度
            Flexible(
              child: Container(
                width: 50,
                height: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),

        Flex(
          direction: Axis.horizontal,
          children: [
            /// 宽度为 50
            Container(
              color: Colors.red,
              width: 50,
              height: 20,
            ),
            /// 宽度为除了左边 50 和右边 50 之外的全部空间
            Flexible(
              child: Container(
                height: 20,
                color: Colors.green,
              ),
            ),
            /// 宽度为 50
            Container(
              color: Colors.blue,
              width: 50,
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}