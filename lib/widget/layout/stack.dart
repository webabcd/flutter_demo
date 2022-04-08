/*
 * Stack - 层叠布局
 *   Positioned - 层叠布局内的绝对定位
 */

import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.red,
        child: Stack(
          /// alignment - 非 Positioned 的子元素的对齐方式
          ///   topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
          alignment: Alignment.bottomRight,
          /// fit - 非 Positioned 的子元素的约束方式
          ///   loose - 使用子元素的原始大小
          ///   expand - 把子元素拉伸到与 Stack 大小一致
          ///   passthrough - 强制子元素使用 Stack 的父级约束
          fit: StackFit.loose,
          /// clipBehavior - 超出范围的子元素的剪裁方式
          ///   none - 不剪裁
          ///   hardEdge - 裁剪但不抗锯齿，速度比 none 慢
          ///   antiAlias - 裁剪而且抗锯齿，速度比 hardEdge 慢
          ///   antiAliasWithSaveLayer - 裁剪而且抗锯齿，并分配一个缓冲区，速度比 antiAlias 慢
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
            /// Positioned - 用于在 Stack 内绝对定位
            ///   left, top, right, bottom, width, height
            Positioned(
              left: 10,
              top: 10,
              width: 200,
              height: 200,
              child: Container(color: Colors.green,),
            ),
          ],
        ),
      ),
    );
  }
}