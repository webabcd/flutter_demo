/*
 * CustomScrollView - 通过 slivers 实现滚动效果
 * SliverSafeArea - 为 sliver 指定安全区域（关于安全区域请参见 /lib/ui/safe_area.dart）
 * SliverPadding - 为指定的 sliver 设置边距
 *
 * 关于 Scrollbar, ScrollController, ScrollNotification 请参见 /lib/widget/scroll/ 中的示例的相关说明
 */

import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatefulWidget {
  const CustomScrollViewDemo({Key? key}) : super(key: key);

  @override
  _CustomScrollViewDemoState createState() => _CustomScrollViewDemoState();
}

class _CustomScrollViewDemoState extends State<CustomScrollViewDemo> {

  final _random = Random();
  Color _getRandomColor() {
    return Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// CustomScrollView 用于通过其 slivers 实现滚动效果
      body: CustomScrollView(
        /// 滚动方向（vertical 或 horizontal）
        /// 如果需要两个方向都滚，那么就需要用两个 CustomScrollView
        scrollDirection: Axis.vertical,
        /// 留白区域占可视区的百分比（0.0 - 1.0 之间）
        anchor: 0.0,
        /// 滚动的响应方式
        ///   NeverScrollableScrollPhysics() - 禁止滚动
        ///   BouncingScrollPhysics() - 允许滚动，滚到边缘后会有类似 ios 的弹簧效果
        ///   ClampingScrollPhysics() - 允许滚动，滚到边缘后会有类似 android 的光波效果
        ///   AlwaysScrollableScrollPhysics() - 允许滚动，滚到边缘后在 ios 中会有弹簧效果，在 android 中会有光波效果
        ///   RangeMaintainingScrollPhysics() - 有 AlwaysScrollableScrollPhysics() 的效果，并且在滚动中即使内容出现了增多或减少也不会影响滚动
        physics: const RangeMaintainingScrollPhysics(),
        /// 是否反向
        reverse: false,
        /// 通过 slivers 实现滚动效果
        slivers: [
          /// SliverSafeArea - 为 sliver 指定安全区域
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) =>
                  Container(color: _getRandomColor(), height: 150,),
                childCount: 5,
              ),
            ),
          ),

          /// SliverPadding - 为指定的 sliver 设置边距
          SliverPadding(
            padding: const EdgeInsets.all(50),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) =>
                  Container(color: _getRandomColor(), height: 150,),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}