/*
 * Scaffold - 脚手架
 *
 * Scaffold 用于组织界面布局，其包含了一个经典页面的所有组织结构
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ScaffoldDemo extends StatefulWidget {
  const ScaffoldDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldDemoState createState() => _ScaffoldDemoState();
}

class _ScaffoldDemoState extends State<ScaffoldDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyText("body"),                               /// 主体内容
      appBar: _appBar(),                                  /// 顶部导航栏，请参见 scaffold_appBar.dart
      bottomNavigationBar: _bottomNavigationBar(),        /// 底部导航栏，请参见 scaffold_bottomNavigationBar.dart
      persistentFooterButtons: _persistentFooterButtons(),/// 底部导航栏上面的一组按钮，请参见 scaffold_persistentFooterButtons.dart
      bottomSheet: _bottomSheet(),                        /// 底部显示的组件，请参见 scaffold_bottomSheet.dart
      floatingActionButton: _floatingActionButton(),      /// 悬浮在界面上的按钮，请参见 scaffold_floatingActionButton.dart
      drawer: _drawer(),                                  /// 左侧抽屉，请参见 scaffold_drawer.dart
      endDrawer: _endDrawer(),                            /// 右侧抽屉，请参见 scaffold_drawer.dart

      backgroundColor: Colors.orange,                     /// 背景色
      resizeToAvoidBottomInset: true,                     /// 设置为 true 则会自动滚动，以避免弹出的软键盘遮住输入框的问题
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('AppBar'),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'favorite',
          icon: Icon(Icons.favorite),
        ),
      ],
    );
  }

  BottomSheet _bottomSheet() {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          height: 60,
          color: Colors.red,
          alignment: Alignment.center,
          child: MyText('BottomSheet'),
        );
      },
    );
  }

  List<Widget> _persistentFooterButtons() {
    return [
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    ];
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      child: Text('关闭'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Drawer _drawer() {
    return Drawer(
      backgroundColor: Colors.yellow,
    );
  }

  Drawer _endDrawer() {
    return Drawer(
      backgroundColor: Colors.purple,
    );
  }
}