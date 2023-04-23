/*
 * SliverAppBar/FlexibleSpaceBar - 可展开/收缩的标题栏（需要在 CustomScrollView 中使用）
 */

import 'dart:math';

import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  const SliverAppBarDemo({Key? key}) : super(key: key);

  @override
  _SliverAppBarDemoState createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {

  final _random = Random();
  Color _getRandomColor() {
    return Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            /// 完全展开时的高度
            expandedHeight: 200,
            /// true - 下拉滚动时，即使当前 CustomScrollView 不在顶部，SliverAppBar 也会向下展开
            /// false - 下拉滚动时，只有当前 CustomScrollView 在顶部时，SliverAppBar 才会向下展开（前提是 snap 为 false）
            floating: true,
            /// true - 手指放开时，SliverAppBar 如果是展开方向的话，则变为完全展开状态；如果是收缩方向且当前 CustomScrollView 不在顶部，则变为完全收缩状态
            /// false - 手指放开时，SliverAppBar 保持当前的展开大小不变
            snap: true,
            /// true - SliverAppBar 在完全收缩状态时，会显示为一个条状组件
            /// false - SliverAppBar 在完全收缩状态时，会彻底隐藏
            pinned: true,

            /// title
            title: const Text('SliverAppBar title'),
            /// 背景颜色
            backgroundColor: Colors.orange,

            /// 还有一些参数的使用基本和 AppBar 是一样的，请参见 /lib/widget/structure/scaffold_app_bar.dart
            /// foregroundColor, leading, automaticallyImplyLeading, actions, bottom, shape, ...

            /// FlexibleSpaceBar - 可展开/收缩
            flexibleSpace: FlexibleSpaceBar(
              /// 背景
              background: Image.asset('assets/son.jpg',fit: BoxFit.cover,),
              /// title
              title: const Text('FlexibleSpaceBar title'),
              /// title 是否显示在中间
              centerTitle: true,
              /// title 的边距
              titlePadding: EdgeInsets.zero,
              /// SliverAppBar 收缩时，FlexibleSpaceBar 背景的动画效果
              ///   parallax - 背景随着 SliverAppBar 的收缩，向上以视差的方式移动，这个是默认值
              ///   pin - 背景随着 SliverAppBar 的收缩，向上跟随移动
              ///   none - 背景位置不变
              collapseMode: CollapseMode.parallax,
              /// SliverAppBar 在完全展开状态时，FlexibleSpaceBar 的 title 的放大倍数
              expandedTitleScale: 1.5,
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) =>
                Container(color: _getRandomColor(), height: 150,),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}