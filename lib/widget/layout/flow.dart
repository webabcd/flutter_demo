/*
 * Flow - 自定义流式布局（所谓流式布局就是一个一个地布局子元素）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class FlowDemo extends StatelessWidget {
  const FlowDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /// 我这里测试发现，只有把 Flow 放到 Scaffold 的 body 中，FlowPaintingContext 的 getChildSize() 才能获取到正确的值
        body: Center(
          child: Flow(
            /// delegate - 自定义一个 FlowDelegate 以便布局所有子元素
            delegate: _FlowDemoDelegate(
                margin: const EdgeInsets.all(10.0)
            ),
            children: [
              Container(width: 80, height:30, color: Colors.red[100],),
              Container(width: 80, height:30, color: Colors.red[200],),
              Container(width: 80, height:30, color: Colors.red[300],),
              Container(width: 80, height:30, color: Colors.red[400],),
              Container(width: 80, height:30, color: Colors.red[500],),
              Container(width: 80, height:30, color: Colors.green[100],),
              Container(width: 80, height:30, color: Colors.green[200],),
              Container(width: 80, height:30, color: Colors.green[300],),
              Container(width: 80, height:30, color: Colors.green[400],),
              Container(width: 80, height:30, color: Colors.green[500],),
            ],
          ),
        ),
      ),
    );
  }
}

/// 自定义 FlowDelegate 用于布局所有子元素
class _FlowDemoDelegate extends FlowDelegate {

  EdgeInsets margin = EdgeInsets.zero;
  _FlowDemoDelegate({
    required this.margin
  });

  /// 绘制所有子元素
  /// FlowPaintingContext - 绘制的上下文
  ///   size - Flow 的尺寸
  ///   childCount - 子元素的数量
  ///   getChildSize() - 获取指定索引的子元素的尺寸（我这里测试发现，只有把 Flow 放到 Scaffold 的 body 中，FlowPaintingContext 的 getChildSize() 才能获取到正确的值）
  ///   paintChild() - 将指定索引的子元素绘制到指定的位置上
  @override
  void paintChildren(FlowPaintingContext context) {

    log("size:${context.size}");

    var x = margin.left;
    var y = margin.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  /// 返回 Flow 的尺寸（Flow 的尺寸是不能自适应的，需要你自己计算）
  @override
  Size getSize(BoxConstraints constraints) {
    /// 这里的 double.infinity 不是无限大的意思，而是尽量大的意思，本例中此值代表的意思就是屏幕的宽
    return const Size(double.infinity, 150);
  }

  /// 是否需要重新绘制
  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}