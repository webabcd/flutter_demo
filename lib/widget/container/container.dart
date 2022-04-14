/*
 * Container - 综合容器（综合了各种效果的容器）
 *   child - 子
 *   width - 宽
 *   height - 高
 *   color - 颜色
 *   alignment - 子相对于 Container 的对齐方式
 *     topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
 *   padding - 内边距
 *   margin - 外边距
 *   constraints - 范围约束，参见 /lib/container/constrainedBox.dart
 *   decoration, foregroundDecoration - 子前面和子后面的装饰，参见 /lib/container/decoratedBox.dart
 *   transform, transformAlignment - 变换和变换的中心点，参见 /lib/shape/transform.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'dart:math' as math;

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// 演示 Container 的宽，高，颜色，子相对于 Container 的对齐方式
        Container(
          width: 200,
          height: 50,
          color: Colors.red,
          alignment: Alignment.center,
          child: MyText("webabcd"),
        ),
        /// 演示 Container 的内边距
        Container(
          width: 200,
          height: 50,
          color: Colors.red,
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.green
          ),
        ),
        /// 演示 Container 的外边距
        Container(
          width: 200,
          height: 50,
          color: Colors.red,
          child: Container(
            color: Colors.green,
            margin: EdgeInsets.all(10),
          ),
        ),
        /// 演示 Container 的范围约束
        Container(
          color: Colors.red,
          constraints: const BoxConstraints(
            minWidth: 50,
            maxWidth: double.infinity,
            minHeight: 50,
            maxHeight: double.infinity,
          ),
          /// 结果 Container 的宽与屏幕的宽相同，高为 50
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.green,
          ),
        ),
        /// 演示 Container 的在 child 的后面定义装饰
        Container(
          width: 180,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: MyText("webabcd"),
        ),
        /// 演示 Container 的在 child 的前面定义装饰
        Container(
          width: 180,
          height: 50,
          foregroundDecoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: MyText("webabcd"),
        ),
        /// 演示 Container 的变换
        Container(
          width: 200,
          height: 50,
          color: Colors.red,
          transform: Matrix4.rotationZ(math.pi),
          transformAlignment: Alignment.center,
          child: MyText("webabcd"),
        ),
      ],
    );
  }
}