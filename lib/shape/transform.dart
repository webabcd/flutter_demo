/*
 * 变换
 *
 * 平移变换
 * 缩放变换
 * 旋转变换
 * 扭曲变换
 * 同时叠加各种变换效果
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'dart:math' as math;

class TransformDemo extends StatelessWidget {
  const TransformDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyDemo(
          /// Transform - 变换
          ///   transform - Matrix4 对象
          ///     Matrix4.translationValues() - 平移变换，也可以用 Transform.translate() 生成平移 Transform 对象
          ///   transformHitTests - 点击区域是否也做相应的变换，默认值为 true
          transform: Transform(
            transform: Matrix4.translationValues(10, 10, 0),
            transformHitTests: true,
            child: Container(
              color: Colors.green,
              child: const MyText('webabcd'),
            ),
          ),
        ),
        MyDemo(
          /// Transform - 变换
          ///   transform - Matrix4 对象
          ///     Matrix4.diagonal3Values() - 缩放变换，也可以用 Transform.scale() 生成缩放 Transform 对象
          ///   transformHitTests - 点击区域是否也做相应的变换，默认值为 true
          ///   alignment - 变换的中心点（这是一个相对位置）
          ///     topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
          ///   origin - 变换的中心点（这是一个绝对位置）
          transform: Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(1.5, 1.5, 0),
            transformHitTests: true,
            child: Container(
              color: Colors.green,
              child: const MyText('webabcd'),
            ),
          ),
        ),
        MyDemo(
          /// Transform - 变换
          ///   transform - Matrix4 对象
          ///     Matrix4.rotationX(), Matrix4.rotationY, Matrix4.rotationZ - 旋转变换，也可以用 Transform.rotate() 生成旋转 Transform 对象
          ///   transformHitTests - 点击区域是否也做相应的变换，默认值为 true
          ///   alignment - 变换的中心点（这是一个相对位置）
          ///     topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
          ///   origin - 变换的中心点（这是一个绝对位置）
          transform: Transform(
            origin: const Offset(20, 10),
            transform: Matrix4.rotationZ(math.pi / 2),
            transformHitTests: true,
            child: Container(
              color: Colors.green,
              child: const MyText('webabcd'),
            ),
          ),
        ),
        MyDemo(
          /// Transform - 变换
          ///   transform - Matrix4 对象
          ///     Matrix4.skewX(), Matrix4.skewY(), Matrix4.skewZ() - 扭曲变换
          ///   transformHitTests - 点击区域是否也做相应的变换，默认值为 true
          ///   alignment - 变换的中心点（这是一个相对位置）
          ///     topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
          ///   origin - 变换的中心点（这是一个绝对位置）
          transform: Transform(
            alignment: Alignment.center,
            transform: Matrix4.skewY(0.3),
            transformHitTests: true,
            child: Container(
              color: Colors.green,
              child: const MyText('webabcd'),
            ),
          ),
        ),
        MyDemo(
          transform: Transform(
            /// Transform - 变换
            ///   transform - Matrix4 对象
            ///     可以通过 Matrix4.identity().. 的方式构造 Matrix4 对象，这样就可以同时叠加多种变换效果了
            ///   transformHitTests - 点击区域是否也做相应的变换，默认值为 true
            ///   alignment - 变换的中心点（这是一个相对位置）
            ///     topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight
            ///   origin - 变换的中心点（这是一个绝对位置）
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateX(math.pi)..rotateY(math.pi)..scale(1.5, 1.5),
            transformHitTests: true,
            child: Container(
              color: Colors.green,
              child: const MyText('webabcd'),
            ),
          ),
        ),
      ],
    );
  }
}

class MyDemo extends StatelessWidget {
  final Transform transform;

  const MyDemo({
    Key? key,
    required this.transform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.red,
          child: const MyText('webabcd'),
        ),
        Opacity(
          opacity: 0.7,
          child: transform,
        ),
      ],
    );
  }
}