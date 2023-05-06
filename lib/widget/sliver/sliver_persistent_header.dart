/*
 * SliverPersistentHeader - 自定义可展开/收缩的标题栏
 */

import 'dart:math';

import 'package:flutter/material.dart';

import '../../helper.dart';

class SliverPersistentHeaderDemo extends StatefulWidget {
  const SliverPersistentHeaderDemo({Key? key}) : super(key: key);

  @override
  _SliverPersistentHeaderDemoState createState() => _SliverPersistentHeaderDemoState();
}

class _SliverPersistentHeaderDemoState extends State<SliverPersistentHeaderDemo> {

  final _random = Random();
  Color _getRandomColor() {
    return Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256),);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          /// 使用自定义可展开/收缩的标题栏
          SliverPersistentHeader(
            delegate: _MySliverPersistentHeaderDelegate(),
            /// true - 下拉滚动时，即使当前 CustomScrollView 不在顶部，SliverPersistentHeader 也会向下展开
            /// false - 下拉滚动时，只有当前 CustomScrollView 在顶部时，SliverPersistentHeader 才会向下展开
            floating: true,
            /// true - SliverPersistentHeader 在完全收缩状态时，其高度为 SliverPersistentHeaderDelegate 的 minExtent
            /// false - SliverPersistentHeader 在完全收缩状态时，会彻底隐藏
            pinned: true,
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

/// 自定义可展开/收缩的标题栏的具体逻辑
class _MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double _minExtent = 100;
  final double _maxExtent = 300;

  /// 当展开/收缩的大小发生变化时就会执行到这里
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    /// shrinkOffset - 高度的偏移量（0 - maxExtent 之间）
    ///   完全展开状态，此值为 0
    ///   完全收缩状态，此值为 maxExtent
    log('shrinkOffset:$shrinkOffset, overlapsContent:$overlapsContent');
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/son.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 完全展开状态的高度
  @override
  double get maxExtent => _maxExtent;

  /// 完全收缩状态的高度
  @override
  double get minExtent => _minExtent;

  /// 如果之后 widget 重新 build 了，就会执行到这里
  /// 一般通过判断 _MySliverPersistentHeaderDelegate 新旧实例的与 UI 相关的参数是否发生变化来决定是否需要重建
  @override
  bool shouldRebuild(covariant _MySliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent || minExtent != oldDelegate.minExtent;
  }
}