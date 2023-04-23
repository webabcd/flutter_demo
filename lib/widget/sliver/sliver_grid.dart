/*
 * SliverGrid - 网格（需要在 CustomScrollView 中使用）
 */

import 'dart:math';

import 'package:flutter/material.dart';

class SliverGridDemo extends StatefulWidget {
  const SliverGridDemo({Key? key}) : super(key: key);

  @override
  _SliverGridDemoState createState() => _SliverGridDemoState();
}

class _SliverGridDemoState extends State<SliverGridDemo> {

  final _random = Random();
  Color _getRandomColor() {
    return Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            /// SliverGridDelegateWithFixedCrossAxisCount() - 用于指定非滚动方向上的元素的数量
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              /// 非滚动方向上的元素的数量
              crossAxisCount: 3,
              /// 滚动方向上的元素之间的间距
              mainAxisSpacing: 10,
              /// 非滚动方向上的元素之间的间距
              crossAxisSpacing: 10,
              /// 滚动方向上的元素的长度（垂直滚动则此参数用于指定网格内元素的高度；水平滚动则此参数用于指定网格内元素的宽度）
              mainAxisExtent: 150,
              /// 如果不指定 mainAxisExtent 则以 childAspectRatio 为准，关于 childAspectRatio 的说明请参见 /lib/widget/list/grid_view.dart
              /// childAspectRatio: 1,
            ),
            /// SliverChildBuilderDelegate - 根据滚动的位置按需创建元素，并且根据数据源动态生成对应的元素
            delegate: SliverChildBuilderDelegate((context, index) =>
                Container(color: _getRandomColor(), height: 150,),
              /// 用于指定列表中的元素数量
              childCount: 50,
              /// 是否将列表内元素用 AutomaticKeepAlive 封装，从而在元素滚动出可视区的时候允许其保持状态（注：前提是元素支持保持状态）
              /// 要想使元素可以保持状态，需要借助 with AutomaticKeepAliveClientMixin，可以参见 /lib/widget/sliver/sliver_list.dart 中的示例
              addAutomaticKeepAlives: true,
              /// 是否将列表内元素用 RepaintBoundary 封装，从而使滚动的时候避免重绘
              addRepaintBoundaries: true,
            ),
          ),

          SliverGrid(
            /// SliverGridDelegateWithMaxCrossAxisExtent() - 用于指定非滚动方向上的元素的最大长度
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              /// 非滚动方向上的元素的最大长度
              /// 比如垂直滚动时，此参数用于指定水平方向上的元素的最大宽度，然后 GridView 会按此要求最终给元素一个合适的宽度
              maxCrossAxisExtent: 50,
              /// 滚动方向上的元素之间的间距
              mainAxisSpacing: 10,
              /// 非滚动方向上的元素之间的间距
              crossAxisSpacing: 10,
              /// 滚动方向上的元素的长度（垂直滚动则此参数用于指定网格内元素的高度；水平滚动则此参数用于指定网格内元素的宽度）
              mainAxisExtent: 150,
              /// 如果不指定 mainAxisExtent 则以 childAspectRatio 为准，关于 childAspectRatio 的说明请参见 /lib/widget/list/grid_view.dart
              /// childAspectRatio: 1,
            ),
            /// SliverChildBuilderDelegate - 根据滚动的位置按需创建元素，并且根据数据源动态生成对应的元素
            delegate: SliverChildBuilderDelegate((context, index) =>
                Container(color: _getRandomColor(), height: 150,),
              /// 用于指定列表中的元素数量
              childCount: 100,
              /// 是否将列表内元素用 AutomaticKeepAlive 封装，从而在元素滚动出可视区的时候允许其保持状态（注：前提是元素支持保持状态）
              /// 要想使元素可以保持状态，需要借助 with AutomaticKeepAliveClientMixin，可以参见 /lib/widget/sliver/sliver_list.dart 中的示例
              addAutomaticKeepAlives: true,
              /// 是否将列表内元素用 RepaintBoundary 封装，从而使滚动的时候避免重绘
              addRepaintBoundaries: true,
            ),
          ),
        ],
      ),
    );
  }
}