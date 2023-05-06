/*
 * CustomMultiChildLayout - 自定义多组件布局
 *
 * 注：约束是从上向下传递的，尺寸是从下向上传递的
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class CustomMultiChildLayoutDemo extends StatefulWidget {
  const CustomMultiChildLayoutDemo({Key? key}) : super(key: key);

  @override
  _CustomMultiChildLayoutDemoState createState() => _CustomMultiChildLayoutDemoState();
}

class _CustomMultiChildLayoutDemoState extends State<CustomMultiChildLayoutDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      /// 自定义布局
      body: CustomMultiChildLayout(
        /// 通过指定的 delegate 实现具体的布局
        delegate: _MyMultiChildLayoutDelegate(),
        children: [
          /// 通过 LayoutId 指定需要布局的组件的 id
          LayoutId(
            id: 'a',
            child: Container(
              color: Colors.red,
            ),
          ),
          LayoutId(
            id: 'b',
            child: Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyMultiChildLayoutDelegate extends MultiChildLayoutDelegate {

  /// 用于对每个子组件做布局
  @override
  void performLayout(Size size) {
    /// 这个 size 就是 CustomMultiChildLayout 的可用空间
    log("performLayout size:$size");

    /// 用于判断 CustomMultiChildLayout 的 children 内是否存在指定 id 的组件
    /// 在 CustomMultiChildLayout 的 children 内需要通过 LayoutId 指定组件的 id
    if (hasChild('a')) {

    }

    /// 对 id 为 a 的组件布局，父把约束告诉子，然后子会把自己的尺寸告诉父
    var size_a = layoutChild("a", BoxConstraints(minWidth: 100, minHeight: 100, maxWidth: 100, maxHeight: 100));
    /// 对 id 为 b 的组件布局，父把约束告诉子，然后子会把自己的尺寸告诉父
    var size_b = layoutChild("b", BoxConstraints(minWidth: 0, minHeight: 0, maxWidth: 100, maxHeight: size.height));

    /// 设置 id 为 a 的组件的位置
    positionChild("a", Offset(0, 0));
    /// 设置 id 为 b 的组件的位置
    positionChild("b", Offset(100, 100));
  }

  /// 如果之后 widget 重新 build 了，就会执行到这里
  /// 一般通过判断 _MyMultiChildLayoutDelegate 新旧实例的与 UI 相关的参数是否发生变化来决定是否需要重新布局
  @override
  bool shouldRelayout(covariant _MyMultiChildLayoutDelegate oldDelegate) {
    return true;
  }

  /// constraints 为 CustomMultiChildLayout 的父传给 CustomMultiChildLayout 的约束
  /// 返回值为 CustomMultiChildLayout 根据约束决定的自己的尺寸
  @override
  Size getSize(BoxConstraints constraints) {
    var size = super.getSize(constraints);
    log('getSize constraints:$constraints, size:$size');
    return size;
  }

  /// constraints 为 CustomMultiChildLayout 传给 id 为 childId 的子的约束
  /// 返回值为子根据约束决定的自己的尺寸
  @override
  Size layoutChild(Object childId, BoxConstraints constraints) {
    var size = super.layoutChild(childId, constraints);
    log('layoutChild childId：$childId, constraints:$constraints, size:$size');
    return size;
  }
}