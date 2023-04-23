/*
 * SliverToBoxAdapter - 为不可滚动组件提供 sliver 效果
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class SliverToBoxAdapterDemo extends StatefulWidget {
  const SliverToBoxAdapterDemo({Key? key}) : super(key: key);

  @override
  _SliverToBoxAdapterDemoState createState() => _SliverToBoxAdapterDemoState();
}

class _SliverToBoxAdapterDemoState extends State<SliverToBoxAdapterDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        /// 指定 slivers
        slivers: [
          SliverAppBar(
            title: const Text('title'),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/son.jpg',fit: BoxFit.cover,),
            ),
            pinned: true,
          ),

          /// SliverToBoxAdapter - 为不可滚动组件提供 sliver 效果
          SliverToBoxAdapter(
            /// 一个不可滚动组件
            child: Column(
              children: [for (var i = 0; i < 100; i++) MyText(i.toString())],
            ),
          ),
        ],
      ),
    );
  }
}