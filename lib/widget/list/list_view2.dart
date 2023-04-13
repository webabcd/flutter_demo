/*
 * ListView - 列表（动态生成）
 *
 * 本例用于演示如何根据数据源动态生成对应的元素（使用 ListView.builder 或 ListView.separated）
 * ListView.separated 和 ListView.builder 都扩展了 ListView 的功能，从而支持根据数据源动态生成对应的元素，也会根据滚动的位置按需创建列表元素
 * ListView.separated 和 ListView.builder 的区别是 ListView.separated 内置了对分隔线的支持
 */

import 'dart:math';

import 'package:flutter/material.dart';

import '../../helper.dart';

class ListView2Demo extends StatefulWidget {
  const ListView2Demo({Key? key}) : super(key: key);

  @override
  _ListView2DemoState createState() => _ListView2DemoState();
}

class _ListView2DemoState extends State<ListView2Demo> {

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

  final Random _random = Random();
  late final List<_MyModel> _myList;

  _MyListView({Key? key}) : super(key: key) {
    _myList = [for (var i = 0; i < 50; i++) _MyModel(name: "webabcd: $i", age: _random.nextInt(100))];
  }

  Widget _getItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.red,
      child: Column(
        children: [
          MyText(_myList[index].name),
          const SizedBox(height: 10),
          MyTextSmall(_myList[index].age.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// ListView.separated 和 ListView.builder 的功能差不错，只不过 ListView.separated 内置了对分隔线的支持
    // return ListView.builder
    return ListView.separated(
      /// 用于指定列表中的元素数量
      itemCount: _myList.length,
      /// 用于构造列表中的每个元素
      itemBuilder: _getItem,
      /// 分隔线
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 5.0, color: Colors.blue);
      },
    );
  }
}

class _MyModel {
  const _MyModel({required this.name, required this.age});
  final String name;
  final int age;
}