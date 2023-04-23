/*
 * GridView - 网格
 *
 * GridView.count() - 用于创建一个有固定数量元素的网格
 * GridView.builder() - 根据数据源动态生成对应的网格元素
 *
 * 另外也可以通过 GridView.custom 结合 SliverGridDelegateWithFixedCrossAxisCount/SliverGridDelegateWithMaxCrossAxisExtent/SliverChildBuilderDelegate 的方式构造 GridView，但是这种方式不常用
 */

import 'dart:math';

import 'package:flutter/material.dart';

import '../../helper.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          /// GridView.count()
          Expanded(child: _Demo1(),),
          /// GridView.builder() 结合 SliverGridDelegateWithFixedCrossAxisCount()
          Expanded(child: _Demo2(),),
          /// GridView.builder() 结合 SliverGridDelegateWithMaxCrossAxisExtent()
          Expanded(child: _Demo3(),),
        ],
      ),
    );
  }
}

class _Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// GridView.count() - 用于创建一个有固定数量元素的网格
    return GridView.count(
      /// 滚动方向 vertical 或 horizontal
      scrollDirection: Axis.vertical,
      /// 非滚动方向上的元素数量
      crossAxisCount: 3,
      /// 滚动方向上的元素之间的间距
      mainAxisSpacing: 10,
      /// 非滚动方向上的元素之间的间距
      crossAxisSpacing: 10,
      /// 网格控件本身的内间距
      padding: const EdgeInsets.all(10),
      /// 举例说明，如果网格是垂直滚动的话
      /// 那么横向排列的元素的数量是确定的，也就是说元素的宽度是确定的，然后通过这个参数指定宽和高的比值，从而确定元素的高度
      childAspectRatio: 2,
      /// 用于控制滚动的 ScrollController
      controller: null,

      /// 下面这 3 个参数的用法和 ListView 是一样的，参见 list_view.dart
      physics: const AlwaysScrollableScrollPhysics(),
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,

      /// 组件集合
      children: [
        Container(color: Colors.red[100],),
        Container(color: Colors.red[200],),
        Container(color: Colors.red[300],),
        Container(color: Colors.red[400],),
        Container(color: Colors.red[500],),
        Container(color: Colors.green[100],),
        Container(color: Colors.green[200],),
        Container(color: Colors.green[300],),
        Container(color: Colors.green[400],),
        Container(color: Colors.green[500],),
        Container(color: Colors.blue[100],),
        Container(color: Colors.blue[200],),
        Container(color: Colors.blue[300],),
        Container(color: Colors.blue[400],),
        Container(color: Colors.blue[500],),
      ],
    );
  }
}

class _Demo2 extends StatelessWidget {

  final Random _random = Random();
  late final List<_MyModel> _myList;

  _Demo2({Key? key}) : super(key: key) {
    _myList = [for (var i = 0; i < 50; i++) _MyModel(name: "webabcd: $i", age: _random.nextInt(100))];
  }

  Widget _getItem(BuildContext context, int index) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextSmall(_myList[index].name),
          MyTextSmall(_myList[index].age.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// GridView.builder() - 根据数据源动态生成对应的网格元素
    return GridView.builder(
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
        /// 如果不指定 mainAxisExtent 则以 childAspectRatio 为准，关于 childAspectRatio 的说明上面已经讲过了
        /// childAspectRatio: 1,
      ),
      /// 滚动方向 vertical 或 horizontal
      scrollDirection: Axis.vertical,
      /// 网格控件本身的内间距
      padding: const EdgeInsets.all(10),

      /// 用于指定网格中的元素数量
      itemCount: _myList.length,
      /// 用于构造网格中的每个元素
      itemBuilder: _getItem,
    );
  }
}

class _Demo3 extends StatelessWidget {

  final Random _random = Random();
  late final List<_MyModel> _myList;

  _Demo3({Key? key}) : super(key: key) {
    _myList = [for (var i = 0; i < 50; i++) _MyModel(name: "webabcd: $i", age: _random.nextInt(100))];
  }

  Widget _getItem(BuildContext context, int index) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextSmall(_myList[index].name),
          MyTextSmall(_myList[index].age.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// GridView.builder() - 根据数据源动态生成对应的网格元素
    return GridView.builder(
      /// SliverGridDelegateWithMaxCrossAxisExtent() - 用于指定非滚动方向上的元素的最大长度
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        /// 非滚动方向上的元素的最大长度
        /// 比如垂直滚动时，此参数用于指定水平方向上的元素的最大宽度，然后 GridView 会按此要求最终给元素一个合适的宽度
        maxCrossAxisExtent: 100,
        /// 滚动方向上的元素之间的间距
        mainAxisSpacing: 10,
        /// 非滚动方向上的元素之间的间距
        crossAxisSpacing: 10,
        /// 滚动方向上的元素的长度（垂直滚动则此参数用于指定网格内元素的高度；水平滚动则此参数用于指定网格内元素的宽度）
        mainAxisExtent: 150,
        /// 如果不指定 mainAxisExtent 则以 childAspectRatio 为准，关于 childAspectRatio 的说明上面已经讲过了
        /// childAspectRatio: 1,
      ),
      /// 滚动方向 vertical 或 horizontal
      scrollDirection: Axis.vertical,
      /// 网格控件本身的内间距
      padding: const EdgeInsets.all(10),

      /// 用于指定网格中的元素数量
      itemCount: _myList.length,
      /// 用于构造网格中的每个元素
      itemBuilder: _getItem,
    );
  }
}

class _MyModel {
  const _MyModel({required this.name, required this.age});
  final String name;
  final int age;
}