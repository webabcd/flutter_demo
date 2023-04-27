/*
 * CustomSingleChildLayout - 自定义单组件布局
 *
 * 注：约束是从上向下传递的，尺寸是从下向上传递的
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class CustomSingleChildLayoutDemo extends StatefulWidget {
  const CustomSingleChildLayoutDemo({Key? key}) : super(key: key);

  @override
  _CustomSingleChildLayoutDemoState createState() => _CustomSingleChildLayoutDemoState();
}

class _CustomSingleChildLayoutDemoState extends State<CustomSingleChildLayoutDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      /// 自定义布局
      body: CustomSingleChildLayout(
        /// 通过指定的 delegate 实现具体的布局
        delegate: _MySingleChildLayoutDelegate(),
        /// 通过 LayoutId 指定需要布局的组件的 id
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}

class _MySingleChildLayoutDelegate extends SingleChildLayoutDelegate {

  /// 用于根据 CustomSingleChildLayout 自己的约束，决定 CustomSingleChildLayout 的子的约束
  /// constraints 为 CustomSingleChildLayout 的父传给 CustomSingleChildLayout 的约束
  /// 返回值为 CustomSingleChildLayout 传给子的约束
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    log("getConstraintsForChild constraints:$constraints");
    var childConstraints = BoxConstraints(minWidth: 0, minHeight: 0, maxWidth: 100, maxHeight: constraints.maxHeight);
    return childConstraints;
  }

  /// 用于根据 CustomSingleChildLayout 自己的尺寸以及 CustomSingleChildLayout 的子的尺寸，决定 CustomSingleChildLayout 的子的位置
  /// size 为 CustomSingleChildLayout 的尺寸
  /// childSize 为 CustomSingleChildLayout 的子的尺寸
  /// 返回值为 CustomSingleChildLayout 的子的位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    log("getPositionForChild size:$size, childSize:$childSize");
    var dx = (size.width - childSize.width) / 2;
    var dy = (size.height - childSize.height) / 2;
    return Offset(dx, dy);
  }

  /// 当 SingleChildLayoutDelegate 发生变化时，通过这里决定是否需要重新布局
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }

  /// constraints 为 SingleChildLayoutDelegate 的父传给 SingleChildLayoutDelegate 的约束
  /// 返回值为 SingleChildLayoutDelegate 根据约束决定的自己的尺寸
  @override
  Size getSize(BoxConstraints constraints) {
    var size = super.getSize(constraints);
    log('getSize constraints:$constraints, size:$size');
    return size;
  }
}