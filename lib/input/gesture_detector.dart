/*
 * GestureDetector - 手势
 *
 * 指针事件是原始的
 * 手势事件封装了指针事件，其用于描述具有特殊语义的操作
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class GestureDetectorDemo extends StatefulWidget {
  const GestureDetectorDemo({Key? key}) : super(key: key);

  @override
  _GestureDetectorDemoState createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {

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
                width: 300,
                height: 150,
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
              /// 当发生了 onDoubleTap 或 onLongPress 时，会先触发此事件（不会触发 onTap 事件）
              onTapCancel: () {
                log('onTapCancel');
              },
            ),
          ),
          Center(
            child: GestureDetector(
              child: Container(
                width: 300,
                height: 150,
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
                width: 300,
                height: 150,
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
        ],
      ),
    );
  }
}