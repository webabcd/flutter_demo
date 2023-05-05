/*
 * 通过 SingleChildRenderObjectWidget 实现自定义组件
 *
 * RenderBox 继承自 RenderObject，其用于在屏幕上绘制内容
 * SingleChildRenderObjectWidget 继承自 RenderObjectWidget
 * SingleChildRenderObjectWidget 是只有一个 child 的 widget，其可以通过重写 createRenderObject() 让指定的 RenderObject 绘制内容
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SingleChildRenderObjectWidgetDemo extends StatefulWidget {
  const SingleChildRenderObjectWidgetDemo({Key? key}) : super(key: key);

  @override
  _SingleChildRenderObjectWidgetDemoState createState() => _SingleChildRenderObjectWidgetDemoState();
}

class _SingleChildRenderObjectWidgetDemoState extends State<SingleChildRenderObjectWidgetDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Container(
        color: Colors.red,
        /// 使用自定义组件
        child: const ShadowBox(
          child: Icon(
            Icons.accessibility,
            color: Colors.black,
            size: 200,
          ),
          shadowOffset: Offset(60, 60),
        ),
      ),
    );
  }
}

/// 继承 SingleChildRenderObjectWidget 实现一个自带阴影效果的自定义组件
class ShadowBox extends SingleChildRenderObjectWidget {
  /// 阴影的偏移量
  final Offset shadowOffset;
  const ShadowBox({super.key, super.child, required this.shadowOffset});

  /// 创建一个 RenderObject 用于绘制内容
  /// 注：这个 createRenderObject() 方法是由对应的 Element 调用的
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderShadowBox(shadowOffset: shadowOffset);
  }

  /// 更新 RenderObject 以便重绘
  /// 注：这个 updateRenderObject() 方法是由对应的 Element 调用的
  @override
  void updateRenderObject(BuildContext context, covariant RenderShadowBox renderObject) {
    renderObject.shadowOffset = shadowOffset;
  }
}

/// 继承 RenderBox 实现自定义绘制逻辑，并通过 with RenderObjectWithChildMixin 简化开发
class RenderShadowBox extends RenderBox with RenderObjectWithChildMixin {
  /// 阴影的偏移量
  late Offset shadowOffset;
  RenderShadowBox({required this.shadowOffset});

  /// 布局
  @override
  void performLayout() {
    /// 布局 child
    /// parentUsesSize 为 true 则自己可以获取到 child 的尺寸
    /// parentUsesSize 为 false 则自己获取不到 child 的尺寸，也就是说自己不需要因 child 的改变而重新布局，从而提高效率
    child!.layout(constraints, parentUsesSize: true);
    /// 设置自己的尺寸与 child 相同（需要 child 在 layout() 的时候设置 parentUsesSize 为 true）
    size = (child as RenderBox).size;
  }

  /// 绘制
  /// 注：绘制是不受布局限制的，也就是说允许在布局之外绘制
  @override
  void paint(PaintingContext context, Offset offset) {
    /// 在指定的位置绘制 child
    context.paintChild(child!, offset);

    /// 在指定的位置添加一个不透明度为 0x40 的图层
    context.pushOpacity(offset, 0x40, (context, offset) {
      /// 在这个图层内的指定位置绘制 child，从而实现阴影效果
      context.paintChild(child!, shadowOffset);
    });
  }
}