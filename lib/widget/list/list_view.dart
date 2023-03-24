/*
 * ListView - 列表（基础）
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: _MyListView(),
    );
  }
}

class _MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            /// 内边距
            padding: const EdgeInsets.all(10),
            /// 滚动方向，也就是列表内元素的排列方向（vertical 或 horizontal）
            scrollDirection: Axis.vertical,
            /// 是否反向排列
            reverse: true,
            /// 滚动的响应方式
            ///   NeverScrollableScrollPhysics() - 禁止滚动
            ///   BouncingScrollPhysics() - 允许滚动，滚到边缘后会有类似 ios 的弹簧效果
            ///   ClampingScrollPhysics() - 允许滚动，滚到边缘后会有类似 android 的光波效果
            ///   AlwaysScrollableScrollPhysics() - 允许滚动，滚到边缘后在 ios 中会有弹簧效果，在 android 中会有光波效果
            ///   RangeMaintainingScrollPhysics() - 有 AlwaysScrollableScrollPhysics() 的效果，并且在滚动中即使内容出现了增多或减少也不会影响滚动
            physics: const AlwaysScrollableScrollPhysics(),
            /// 用于定义每个元素在滚动方向上的尺寸
            /// 比如垂直滚动的话，这里就是设置每个元素的高；水平滚动的话，这里就是设置每个元素的宽
            /// 也可以不指定这个，那么就由每个元素自己决定尺寸（注：建议使用 itemExtent 指定尺寸，这样性能会好一些）
            itemExtent: 400,
            /// 列表内元素超出显示范围后是否保持其状态，如果是 true 的话，那么元素再次显示的时候就会快速构建
            addAutomaticKeepAlives: true,
            /// 是否将列表内元素用一个重绘边界（Repaint Boundary）封装，从而使滚动的时候避免重绘
            addRepaintBoundaries: true,
            /// 列表的元素集合
            /// 如果用 children 的话，则在初始化的时就会把所有元素都创建好
            /// 所以对于大数据量的话请用 ListView.builder，它会根据滚动的位置，按需创建列表元素
            children: <Widget>[
              Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: const MyText('aaaaaa'),
              ),
              Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const MyText('bbbbbb'),
              ),
              Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const MyText('cccccc'),
              ),
            ],
          ),
        ),
        Expanded(
          /// 水平滚动的 ListView
          child: ListView(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                width: 100,
                color: Colors.red,
                alignment: Alignment.center,
                child: const MyText('aaaaaa'),
              ),
              Container(
                width: 500,
                color: Colors.green,
                alignment: Alignment.center,
                child: const MyText('bbbbbb'),
              ),
              Container(
                width: 800,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const MyText('cccccc'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}