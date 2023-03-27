/*
 * ListView - 列表（下拉刷新和上拉加载）
 */

import 'dart:math';

import 'package:flutter/material.dart';

import '../../helper.dart';

class ListView3Demo extends StatefulWidget {
  const ListView3Demo({Key? key}) : super(key: key);

  @override
  _ListView3DemoState createState() => _ListView3DemoState();
}

class _ListView3DemoState extends State<ListView3Demo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: _MyListView(),
    );
  }
}

class _MyListView extends StatefulWidget {
  const _MyListView({Key? key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<_MyListView> {

  final Random _random = Random();
  late final List<_MyModel> _myList;

  int _pageIndex = 0;
  final int _pageSize = 20;
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;

  @override
  void initState() {
    _myList = [];
    _loadData();

    /// 根据滚动位置判断是否需要触发上拉加载
    _scrollController.addListener(() {
      if (_scrollController.offset > _scrollController.position.maxScrollExtent - 20) {
        if (!_isLoading) {
          _pageIndex++;
          _loadData();
        }
      }
    });

    super.initState();
  }

  Widget _getItem(BuildContext context, int index) {
    /// 列表中最后一行显示的是"加载中..."
    if (index == _myList.length) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              MyText("加载中...",),
              SizedBox(width: 40, height: 40, child: CircularProgressIndicator(strokeWidth: 1.0,),),
            ],
          ),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(10),
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyText(_myList[index].name),
            MyTextSmall(_myList[index].age.toString()),
          ],
        ),
      );
    }
  }

  Future<void> _onRefresh() async {
    _pageIndex = 0;
    _myList.clear();

    return _loadData();
  }

  void _loadData() async {
    _isLoading = true;
    await Future.delayed(const Duration(milliseconds: 3000));

    setState(() {
      var list = [for (var i = _pageIndex * _pageSize; i < _pageIndex * _pageSize + _pageSize; i++) _MyModel(name: "webabcd: $i", age: _random.nextInt(100))];
      _myList.addAll(list);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 通过 RefreshIndicator 实现下拉刷新
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _myList.length + 1,
        itemExtent: 80,
        itemBuilder: _getItem,
      ),
    );
  }
}

class _MyModel {
  const _MyModel({required this.name, required this.age});
  final String name;
  final int age;
}