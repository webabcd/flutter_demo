/*
 * SliverList - 列表（需要在 CustomScrollView 中使用）
 * SliverFixedExtentList - 在 SliverList 的基础上增加了对 itemExtent 的支持
 */

import 'dart:math';

import 'package:flutter/material.dart';

class SliverListDemo extends StatefulWidget {
  const SliverListDemo({Key? key}) : super(key: key);

  @override
  _SliverListDemoState createState() => _SliverListDemoState();
}

class _SliverListDemoState extends State<SliverListDemo> {

  final _random = Random();
  Color _getRandomColor() {
    return Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            /// SliverChildListDelegate - 初始化的时就会把所有元素都创建好
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red, height: 150,),
                Container(color: Colors.green, height: 150,),
                Container(color: Colors.blue, height: 150,),
              ],
              /// 列表内元素超出显示范围后是否保持其状态，如果是 true 的话，那么元素再次显示的时候就会快速构建
              addAutomaticKeepAlives: true,
              /// 是否将列表内元素用一个重绘边界（Repaint Boundary）封装，从而使滚动的时候避免重绘
              addRepaintBoundaries: true,
            ),
          ),

          SliverList(
            /// SliverChildBuilderDelegate - 根据滚动的位置按需创建元素，并且根据数据源动态生成对应的元素
            delegate: SliverChildBuilderDelegate((context, index) =>
                Container(color: _getRandomColor(), height: 150,),
              /// 用于指定列表中的元素数量
              childCount: 20,
              /// 列表内元素超出显示范围后是否保持其状态，如果是 true 的话，那么元素再次显示的时候就会快速构建
              addAutomaticKeepAlives: true,
              /// 是否将列表内元素用一个重绘边界（Repaint Boundary）封装，从而使滚动的时候避免重绘
              addRepaintBoundaries: true,
            ),
          ),

          SliverFixedExtentList(
            /// 用于定义每个元素在滚动方向上的尺寸
            /// 比如垂直滚动的话，这里就是设置每个元素的高；水平滚动的话，这里就是设置每个元素的宽
            /// 也可以不指定这个，那么就由每个元素自己决定尺寸（注：建议使用 itemExtent 指定尺寸，这样性能会好一些）
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((context, index) =>
                Container(color: _getRandomColor(),),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}