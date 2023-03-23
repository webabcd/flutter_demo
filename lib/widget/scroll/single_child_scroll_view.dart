/*
 * SingleChildScrollView - 可滚动组件（让一个子可以滚动）
 * Scrollbar - 滚动条
 *
 * 一般在一个 Scrollbar 下放一个 SingleChildScrollView，默认的 ScrollController 会控制他们之间的联动
 * 如果不需要显示滚动条的话，那么就只使用 SingleChildScrollView 就行了
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../helper.dart';

class SingleChildScrollViewDemo extends StatefulWidget {
  const SingleChildScrollViewDemo({Key? key}) : super(key: key);

  @override
  _SingleChildScrollViewDemoState createState() => _SingleChildScrollViewDemoState();
}

class _SingleChildScrollViewDemoState extends State<SingleChildScrollViewDemo> {

  final String _string = "012345678901234567890123456789012345678901234567890123456789";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      /// Scrollbar - 滚动条，可以与其内的可滚动组件联动
      body: Scrollbar(
        /// 滚动条的宽度
        thickness: 10,
        /// 滚动条两端的圆角半径
        radius: const Radius.circular(10),
        /// 是否显示滚动条滑块
        thumbVisibility: false,
        /// 是否显示滚动条轨道
        trackVisibility: false,
        /// SingleChildScrollView - 支持一个子的可滚动组件
        child: SingleChildScrollView(
          /// 滚动方向（vertical 或 horizontal）
          /// 如果需要两个方向都滚，那么就需要用两个 SingleChildScrollView
          scrollDirection: Axis.vertical,
          /// 内边距
          padding: EdgeInsets.zero,
          /// 用于确定什么时候触发拖动事件（我这里测试时看不出二者的区别）
          ///   start - 出现拖拽手势的时候触发拖动事件
          ///   down - 手指按下的时候触发拖动事件
          dragStartBehavior: DragStartBehavior.start,
          /// 滚动的响应方式
          ///   NeverScrollableScrollPhysics() - 禁止滚动
          ///   BouncingScrollPhysics() - 允许滚动，滚到边缘后会有类似 ios 的弹簧效果
          ///   ClampingScrollPhysics() - 允许滚动，滚到边缘后会有类似 android 的光波效果
          ///   AlwaysScrollableScrollPhysics() - 允许滚动，滚到边缘后在 ios 中会有弹簧效果，在 android 中会有光波效果
          ///   RangeMaintainingScrollPhysics() - 有 AlwaysScrollableScrollPhysics() 的效果，并且在滚动中即使内容出现了增多或减少也不会影响滚动
          physics: const RangeMaintainingScrollPhysics(),
          /// 需要滚动的子
          child: Center(
            child: Column(
              children:_string.split("").map((c) => MyText(c)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}