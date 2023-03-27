/*
 * RefreshIndicator - 下拉刷新进度条
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class RefreshIndicatorDemo extends StatefulWidget {
  const RefreshIndicatorDemo({Key? key}) : super(key: key);

  @override
  _RefreshIndicatorDemoState createState() => _RefreshIndicatorDemoState();
}

class _RefreshIndicatorDemoState extends State<RefreshIndicatorDemo> {

  late final List<String> _myList;

  @override
  void initState() {
    _myList = [for (var i = 0; i < 50; i++) "webabcd: $i"];
    super.initState();
  }

  Future<void> _onRefresh() async {
    log("显示下拉刷新");
    await Future.delayed(const Duration(milliseconds: 3000));
    log("隐藏下拉刷新");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: RefreshIndicator(
        /// 触发刷新后调用的 Future<void> 方法（调用此方法时会显示下拉刷新，此方法完成后会隐藏下拉刷新）
        onRefresh: _onRefresh,
        /// 触发刷新的条件，默认为当可滚动组件滚动到边缘时触发
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        /// 下拉刷新的进度条的前景色
        color: Colors.red,
        /// 下拉刷新的进度条的背景色
        backgroundColor: Colors.green,
        /// 下拉刷新的进度条的宽度
        strokeWidth: 5,
        /// 下拉刷新的进度条，完全显示后的位置
        displacement: 40,
        /// 下拉刷新的进度条，准备显示前的位置
        edgeOffset: 0,
        child: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(10),
              color: Colors.red,
              child: MyText(_myList[index]),
            );
          },
        ),
      ),
    );
  }
}