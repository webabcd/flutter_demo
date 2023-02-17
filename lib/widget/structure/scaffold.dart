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
      drawer: _drawer(),                                  /// 左侧抽屉（侧滑菜单），请参见 scaffold_drawer.dart
      endDrawer: _endDrawer(),                            /// 右侧抽屉（侧滑菜单），请参见 scaffold_drawer.dart

      persistentFooterButtons: <Widget>[                          /// 底部导航栏上面的一组 widget
        Container(width: 100, height: 20, color: Colors.red,),
        Container(width: 100, height: 20, color: Colors.green,),
        Container(width: 100, height: 20, color: Colors.blue,),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,     /// 底部导航栏上面的一组 widget 的对齐方式

      floatingActionButton: Builder(                              /// 悬浮在界面上的按钮
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: Text('show'),
            onPressed: () {
              //Navigator.pop(context);
              Scaffold.of(context).showBottomSheet((context) {    /// 弹出 BottomSheet（下滑可消失）
                return Container(
                  height: 200,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const MyText("close"),
                    onPressed: () {
                      /// 关闭当前的 BottomSheet
                      Navigator.of(context).pop();
                    },
                  ),
                );
              });
            },
          );
        },
      ),

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