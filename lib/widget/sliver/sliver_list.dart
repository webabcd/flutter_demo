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
            ),
          ),

          SliverList(
            /// SliverChildBuilderDelegate - 根据滚动的位置按需创建元素，并且根据数据源动态生成对应的元素
            delegate: SliverChildBuilderDelegate((context, index) =>
                Container(color: _getRandomColor(), height: 150,),
              /// 用于指定列表中的元素数量
              childCount: 10,
              /// 是否将列表内元素用 AutomaticKeepAlive 封装，从而在元素滚动出可视区的时候允许其保持状态（注：前提是元素支持保持状态）
              /// 要想使元素可以保持状态，需要借助 with AutomaticKeepAliveClientMixin，后面会有详细说明
              /// 通过测试本例可以发现，这个 SliverList 内的 Container 每次重新滚动到可视区的时候颜色都会变化，其并不会保持状态
              addAutomaticKeepAlives: true,
              /// 是否将列表内元素用 RepaintBoundary 封装，从而使滚动的时候避免重绘
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
              childCount: 10,
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildBuilderDelegate((context, index) =>
                _MyWidget(color: _getRandomColor(),),
              childCount: 10,
              /// 是否将列表内元素用 AutomaticKeepAlive 封装，从而在元素滚动出可视区的时候允许其保持状态（注：前提是元素支持保持状态）
              /// 要想使元素可以保持状态，需要借助 with AutomaticKeepAliveClientMixin，请参见本例使用的 _MyWidget 中的说明
              /// 通过测试本例可以发现，这个 SliverList 内的 _MyWidget 每次重新滚动到可视区的时候颜色都不会变化，其会保持状态
              addAutomaticKeepAlives: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyWidget extends StatefulWidget {
  const _MyWidget({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

/// 如果需要当前元素可以保持状态，则可以使用 with AutomaticKeepAliveClientMixin
class _MyWidgetState extends State<_MyWidget> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    /// 用了 with AutomaticKeepAliveClientMixin 则这里必须要 super.build(context);
    super.build(context);

    return Container(
      color: widget.color,
    );
  }

  /// 需要保持状态
  @override
  bool get wantKeepAlive => true;
}