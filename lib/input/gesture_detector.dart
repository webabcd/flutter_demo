/*
 * GestureDetector - 手势
 *
 * 指针事件是原始的
 * 手势事件封装了指针事件，其用于描述具有特殊语义的操作
 *
 * 注：
 * 如果需要让任意组件支持点击事件则就用 GestureDetector 就行
 * 如果需要让任意组件支持点击事件，并且还要支持点击的动画效果，则可以用 Ink/InkWell/InkResponse，参见 /widget/button/ink.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class GestureDetectorDemo extends StatefulWidget {
  const GestureDetectorDemo({Key? key}) : super(key: key);

  @override
  _GestureDetectorDemoState createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {

  double _angle = 0.0;
  double _scaleX = 1.0;
  double _scaleY = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            /// 通过 GestureDetector 监听手势事件
            child: GestureDetector(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.red,
              ),
              /// 按下
              onTapDown: (details) { /// details 是一个 TapDownDetails 对象
                /// globalPosition - 相对于屏幕的位置
                /// localPosition - 相对于父的位置
                log('onTapDown: ${details.globalPosition}, ${details.localPosition}');
              },
              /// 抬起
              onTapUp: (details) { /// details 是一个 TapUpDetails 对象
                log('onTapUp: ${details.globalPosition}, ${details.localPosition}');
              },
              /// 点击
              onTap: () {
                log('onTap');
              },
              /// 双击
              onDoubleTap: () {
                log('onDoubleTap');
              },
              /// 长按
              onLongPress: () {
                log('onLongPress');
              },
              /// 长按后移动
              onLongPressMoveUpdate: (details) {
                log('onLongPressMoveUpdate: ${details.globalPosition}, ${details.localPosition}');
              },
              /// 当发生了 onDoubleTap 或 onLongPress 时，会先触发此事件（不会触发 onTap 事件）
              onTapCancel: () {
                log('onTapCancel');
              },
              /// onSecondaryTap, onSecondaryTapDown, onSecondaryTapUp - 鼠标右键单击
              /// onTertiaryTapDown, onTertiaryTapUp - 鼠标中键单击
              /// onSecondaryLongPress, onSecondaryLongPressMoveUpdate - 鼠标右键长按
              /// onTertiaryLongPress, onTertiaryLongPressMoveUpdate - 鼠标中键长按
            ),
          ),

          Center(
            child: GestureDetector(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.green,
              ),
              /// 触摸且有位移的手势开始时（不可与 onHorizontalDragStart 或 onVerticalDragStart 共存）
              onPanStart: (details) { /// details 是一个 DragStartDetails 对象
                log('onPanStart: ${details.globalPosition}, ${details.localPosition}');
              },
              /// 触摸且有位移的手势移动时（不可与 onHorizontalDragUpdate 或 onVerticalDragUpdate 共存）
              onPanUpdate: (details) { /// details 是一个 DragUpdateDetails 对象
                log('onPanUpdate: ${details.globalPosition}, ${details.localPosition}');
              },
              /// 触摸且有位移的手势结束时（不可与 onHorizontalDragEnd 或 onVerticalDragEnd 共存）
              onPanEnd: (details) { /// details 是一个 DragEndDetails 对象
                /// velocity - 用于描述位移的速度
                log('onPanEnd: ${details.velocity}');
              },
            ),
          ),

          Center(
            child: GestureDetector(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),

              /// Y 轴位移相关事件
              onVerticalDragStart: (details) {
                log('onVerticalDragStart: ${details.globalPosition}, ${details.localPosition}');
              },
              onVerticalDragUpdate: (details) {
                log('onVerticalDragUpdate: ${details.globalPosition}, ${details.localPosition}');
              },
              onVerticalDragEnd: (details) {
                log('onVerticalDragEnd: ${details.velocity}');
              },

              /// X 轴位移相关事件
              onHorizontalDragStart: (details) {
                log('onHorizontalDragStart: ${details.globalPosition}, ${details.localPosition}');
              },
              onHorizontalDragUpdate: (details) {
                log('onHorizontalDragUpdate: ${details.globalPosition}, ${details.localPosition}');
              },
              onHorizontalDragEnd: (details) {
                log('onHorizontalDragEnd: ${details.velocity}');
              },
            ),
          ),

          GestureDetector(
            child: Transform.scale(
              scaleX: _scaleX,
              scaleY: _scaleY,
              child: Transform.rotate(
                angle: _angle,
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.orange,
                ),
              ),
            ),
            /// 两点触摸操作的相关事件
            onScaleStart: (ScaleStartDetails details) {
              log('onScaleStart');
            },
            onScaleEnd: (ScaleEndDetails details) {
              log('onScaleEnd');
              _angle = 0.0;
              _scaleX = 1.0;
              _scaleY = 1.0;
              setState(() {});
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              _angle = details.rotation;          /// 旋转的弧度
              _scaleX = details.horizontalScale;  /// 水平方向上的缩放倍数
              _scaleY = details.verticalScale;    /// 垂直方向上的缩放倍数
              var _ = details.scale;              /// 缩放倍数
              setState(() {});
            },


          ),

          /// 手势事件是不会冒泡的，需要冒泡的话请用指针事件
          Center(
            child: GestureDetector(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.red,
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.green,
                  ),
                  onTap: () {
                    log('onTap green');
                  },
                ),
              ),
              onTap: () {
                log('onTap red');
              },
            ),
          ),
        ],
      ),
    );
  }
}