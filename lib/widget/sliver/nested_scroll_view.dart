/*
 * NestedScrollView - 为可滚动组件提供 sliver 效果
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class NestedScrollViewDemo extends StatefulWidget {
  const NestedScrollViewDemo({Key? key}) : super(key: key);

  @override
  _NestedScrollViewDemoState createState() => _NestedScrollViewDemoState();
}

class _NestedScrollViewDemoState extends State<NestedScrollViewDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// NestedScrollView - 为可滚动组件提供 sliver 效果
      body: NestedScrollView(
        /// 用于构造 slivers
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text('title'),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/son.jpg',fit: BoxFit.cover,),
              ),
              pinned: true,
            ),
          ];
        },

        /// 一个可滚动组件
        body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 20,
          itemBuilder: (BuildContext context,int index) {
            return Container(
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
              alignment: Alignment.center,
              child: MyText('$index'),
            );
          },
        ),
      ),
    );
  }
}