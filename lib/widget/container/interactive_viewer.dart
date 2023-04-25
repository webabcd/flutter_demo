/*
 * InteractiveViewer - 手动拖动/手动缩放
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class InteractiveViewerDemo extends StatefulWidget {
  const InteractiveViewerDemo({Key? key}) : super(key: key);

  @override
  _InteractiveViewerDemoState createState() => _InteractiveViewerDemoState();
}

class _InteractiveViewerDemoState extends State<InteractiveViewerDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Container(
        height: 400,
        width: 400,
        color: Colors.red,
        child: InteractiveViewer(
          /// 是否允许手动拖动
          panEnabled: true,
          /// 允许的拖动行为
          ///   free - 允许任意方向拖动
          ///   horizontal - 仅允许水平方向拖动
          ///   vertical - 仅允许垂直方向拖动
          ///   aligned - 仅允许水平方向和垂直方向拖动
          panAxis: PanAxis.free,
          /// 可拖动的范围
          boundaryMargin: const EdgeInsets.all(500),

          /// 是否允许手动缩放
          scaleEnabled: true,
          /// 最大缩放倍数
          maxScale: 3.0,
          /// 最小缩放倍数
          minScale: 0.3,

          /// 初始时，是否将 child 约束为与 InteractiveViewer 的大小一致
          constrained: false,

          /// 交互开始时
          onInteractionStart: (details) {
            log("onInteractionStart, $details");
          },
          /// 交互结束时
          onInteractionEnd: (details) {
            log("onInteractionEnd, $details");
          },
          /// 交互的结果发生变化时
          onInteractionUpdate: (ScaleUpdateDetails details) {
            /// ScaleUpdateDetails - 交互结果
            ///   focalPoint - 相对于屏幕的左上角的偏移量
            ///   localFocalPoint - 相对于父的左上角的偏移量
            ///   scale - 缩放倍数
            ///   horizontalScale - 水平缩放倍数
            ///   verticalScale - 垂直缩放倍数
            log("onInteractionUpdate, $details");
          },

          child: Image.asset(
            "assets/son.jpg",
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}