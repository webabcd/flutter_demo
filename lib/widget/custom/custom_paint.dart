/*
 * 通过 CustomPaint 实现自定义组件
 *
 * CustomPaint 继承自 SingleChildRenderObjectWidget
 * 关于 SingleChildRenderObjectWidget 的说明请参见 single_child_render_object_widget.dart
 *
 * CustomPaint 通过 CustomPainter 实现自定义的绘制逻辑，关于 CustomPainter 的说明请参见 /lib/widget/shape/paint.dart
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class CustomPaintDemo extends StatefulWidget {
  const CustomPaintDemo({Key? key}) : super(key: key);

  @override
  _CustomPaintDemoState createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: const Center(
        /// 使用自定义组件
        child: BorderWidget(
          child: MyText("我是 CustomPaint 的 child"),
          borderWidth: 2,
        ),
      ),
    );
  }
}

/// 继承 CustomPaint 实现一个自带边框效果的自定义组件
/// 先绘制 painter，然后在 painter 的前面渲染 child, 然后在 child 的前面绘制 foregroundPainter
class BorderWidget extends CustomPaint {
  final double borderWidth;
  const BorderWidget({super.key, super.child, required this.borderWidth});

  /// 如果不指定 child 则 CustomPaint 使用 size 作为自己的尺寸
  /// 如果指定了 child 则 CustomPaint 使用 child 的尺寸作为自己的尺寸
  @override
  Size get size => Size.zero;

  @override
  CustomPainter? get painter => MyCustomPainter(borderWidth: borderWidth);

  @override
  CustomPainter? get foregroundPainter => null;
}

/// CustomPainter - 自定义绘制逻辑
/// 原点在左上角，右为 x 轴正方向，下为 y 轴正方向，顺时针为旋转正方向
/// 弧度是弧的长度与弧的半径的比值，所以弧度 π 就是 180 度
class MyCustomPainter extends CustomPainter {
  double borderWidth;
  MyCustomPainter({required this.borderWidth});

  /// 自定义绘制
  ///   canvas - 画布，所有 canvas 的操作都是调用的 native 方法
  ///   size - 绘制区域（即 CustomPaint 的尺寸，参见上面 CustomPaint 的 size 的说明）
  @override
  void paint(Canvas canvas, Size size) {
    /// 创建一个画笔
    final paint = Paint()..color = Colors.white..strokeWidth = borderWidth..style = PaintingStyle.stroke;
    /// 通过 Offset & Size 生成一个 Rect
    final rect = Offset.zero & size;
    /// 绘制一个边框
    canvas.drawRect(rect, paint);
  }

  /// 如果之后 widget 重新 build 了，就会执行到这里
  /// 一般通过判断 MyCustomPainter 新旧实例的与 UI 相关的参数是否发生变化来决定是否需要重绘
  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    /// 新旧 MyCustomPainter 实例的 borderWidth 不同时，则重绘
    return borderWidth != oldDelegate.borderWidth;
  }
}