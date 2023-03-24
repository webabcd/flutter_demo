/*
 * Container - 综合容器（综合了各种效果的容器）
 *   child - 子
 *   width - 宽，设置为 double.infinity 代表尽量宽
 *   height - 高，设置为 double.infinity 代表尽量高
 *   color - 颜色
 *   alignment - 子相对于 Container 的对齐方式
 *     topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
 *   padding - 内边距
 *   margin - 外边距
 *   constraints - 范围约束，参见 /lib/container/constrained_box.dart
 *   decoration, foregroundDecoration - 子前面和子后面的装饰，参见 /lib/container/decorated_box.dart
 *   transform, transformAlignment - 变换和变换的中心点，参见 /lib/shape/transform.dart
 *
 * 注：当 Container 没有 child 时其宽高与父相同，当 Container 有 child 时其宽高与 child 相同
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
        
        /// Container 的宽高与父相同
        /// Container 会让其 child 自行决定宽高
        Container(
          width: 200,
          height: 50,
          color: Colors.red,
          /// alignment - child 相对于 Container 的对齐方式
          ///   topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
          alignment: Alignment.center,
          child: MyText("webabcd"),
        ),

        /// 观察下面 2 个 Container 的效果，当不指定 Container 的宽的时候
        /// 1、如果没指定 alignment 则 Container 的宽与子一样
        /// 2、如果指定了 alignment 则 Container 的宽会尽量大
        Container(
          color: Colors.red,
          child: MyText("webabcd"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: MyText("webabcd"),
        ),

        /// Container 的宽高逻辑和 SizedBox 的逻辑是一样的，下面会显示一个 200 * 50 的绿色矩形
        Container(
          width: 200, height: 50, color: Colors.red,
          child: Container(color: Colors.green, width: 1, height: 1,),
        ),
        /// Container 的宽高逻辑和 SizedBox 的逻辑是一样的，下面会显示一个 200 * 30 的绿色矩形
        Container(
          width: 200, color: Colors.red,
          child: Container(color: Colors.green, width: 1, height: 30,),
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