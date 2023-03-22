/*
 * 绘制
 *
 * CustomPaint - 用于自定义绘制的 Widget（其内通过 CustomPainter 实现自定义的绘制逻辑）
 */

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class PaintDemo extends StatefulWidget {
  const PaintDemo({Key? key}) : super(key: key);

  @override
  _PaintDemoState createState() => _PaintDemoState();
}

class _PaintDemoState extends State<PaintDemo> {

  /// 这个用于演示如何通过 CustomPainter 绘制指定的图像（注：这个 Image 是 dart:ui 库中的 Image）
  ui.Image? _image;

  /// 获取图像数据
  Future<ui.Image> loadImage(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void initState() {
    super.initState();

    /// 注：在 pubspec.yaml 中配置好需要打包的文件后，这里才能正确加载
    loadImage("assets/son.jpg").then((i) {
      setState(() {
        _image = i;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      /// CustomPaint - 用于自定义绘制的 Widget
      ///   先绘制 painter，然后在 painter 的前面渲染 child, 然后在 child 的前面绘制 foregroundPainter
      child:CustomPaint(
        painter: MyCustomPainter(_image),
        child: const Center(
          child: MyText("我是 CustomPaint 的 child"),
        ),
        foregroundPainter: null,
      ),
    );
  }
}

/// CustomPainter - 自定义绘制逻辑
/// 原点在左上角，右为 x 轴正方向，下为 y 轴正方向，顺时针为旋转正方向
/// 弧度是弧的长度与弧的半径的比值，所以弧度 π 就是 180 度
class MyCustomPainter extends CustomPainter {
  ui.Image? image;

  MyCustomPainter(this.image);

  /// Paint - 画笔
  final Paint _paint = Paint()
    /// 画笔颜色
    ..color = Colors.blue
    /// 画笔宽度
    ..strokeWidth = 5
    /// 是否抗锯齿
    ..isAntiAlias = true
    /// 绘制风格
    /// fill - 比如画个圆，中间会被自动填充
    /// stroke - 比如画个圆，中间不会被填充
    ..style = PaintingStyle.fill
    /// 模糊效果
    // ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 3.0)
    /// 渲染质量
    ..filterQuality = FilterQuality.high
    /// 画笔两端的处理方式
    /// round - 有一个圆形的延伸
    /// square - 有一个矩形的延伸
    /// butt - 无特殊处理
    ..strokeCap = StrokeCap.round
    /// 画笔拐角处的处理方式（比如三角形的三个顶点）
    /// round - 圆角处理
    /// miter - 尖角处理
    /// bevel - 斜切处理
    ..strokeJoin = StrokeJoin.bevel
  ;

  /// 自定义绘制
  ///   canvas - 画布，所有 canvas 的操作都是调用的 native 方法
  ///   size - 绘制区域，由 CustomPaint 的构造函数传入
  @override
  void paint(Canvas canvas, Size size) {
    log("paint size: $size");

    var points1 = [
      Offset(40, 40),
      Offset(140, 40),
      Offset(240, 40),
    ];
    _paint.strokeWidth = 20;
    /// 画点
    canvas.drawPoints(ui.PointMode.points, points1, _paint);

    var points2 = [
      Offset(40, 60),
      Offset(140, 60)
    ];
    _paint.strokeWidth = 5;
    /// 画直线
    canvas.drawPoints(ui.PointMode.lines, points2, _paint);

    var points3 = [
      Offset(240, 60),
      Offset(300, 100),
      Offset(240, 100),
    ];
    /// 画折线
    canvas.drawPoints(ui.PointMode.polygon, points3, _paint);

    /// 画圆（需要指定圆心和半径）
    canvas.drawCircle(const Offset(50, 120), 30, _paint);

    /// 画椭圆（在指定的矩形内绘制椭圆）
    canvas.drawOval(const Rect.fromLTRB(150, 120, 300, 180), _paint);

    _paint.style = PaintingStyle.stroke;
    /// 画圆弧
    ///   第 1 个参数：在指定的矩形内绘制椭圆
    ///   第 2 个参数：从椭圆上截取的圆弧的起始点的弧度
    ///   第 3 个参数：从椭圆上截取的圆弧的起始点到结束点的弧度
    ///   第 4 个参数：圆弧的两个端点是否要与椭圆的圆心用直线相连
    canvas.drawArc(const Rect.fromLTRB(40, 150, 200, 200), pi / 2, pi / 2, false, _paint);

    /// 画矩形
    canvas.drawRect(const Rect.fromLTRB(40, 240, 160, 300), _paint);

    /// 画圆角矩形
    canvas.drawRRect(RRect.fromLTRBAndCorners(200, 240, 300, 300, topLeft: const Radius.circular(20),), _paint);

    /// 画路径
    _paint.style = PaintingStyle.stroke;
    var path = Path()
      ..moveTo(40, 320)
      ..lineTo(80, 400)
      ..lineTo(40, 400)
      ..close(); /// 调用 close() 则自动连接起点和终点
    canvas.drawPath(path, _paint);

    /// 通过 path.arcTo() 画二次贝塞尔曲线
    /// 通过 path.cubicTo() 画三次贝塞尔曲线

    if (image != null) {
      /// 画 Image
      ///   第 1 个参数：需要画的 Image（注：这个 Image 是 dart:ui 库中的 Image）
      ///   第 2 个参数：从原图中截取指定矩形范围内的图像数据
      ///   第 3 个参数：在指定的矩形范围内拉伸并显示截取的图像数据
      canvas.drawImageRect(
          image!,
          Rect.fromLTRB(0, 0, image!.width.toDouble() - 20, image!.height.toDouble() - 20),
          Rect.fromLTRB(100, 320, 300, 400),
          _paint
      );
    }
  }

  /// 是否需要重绘，通常新实例与旧实例不同时则返回 true
  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}