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
    return Theme(
      data: ThemeData().copyWith(
        /// 默认主题，会在 persistentFooterButtons 的上面显示一条分隔线，通过如下方式可以隐藏这个分隔线
        dividerColor: Colors.transparent,
      ),
      child: Scaffold(
        body: const MyText("body"),                         /// 主体内容
        appBar: _appBar(),                                  /// 顶部导航栏，一个 PreferredSizeWidget 对象，请参见 scaffold_app_bar.dart
        bottomNavigationBar: _bottomNavigationBar(),        /// 底部导航栏，一个 Widget 对象，请参见 scaffold_bottom_navigation_bar.dart
        drawer: _drawer(),                                  /// 左侧抽屉（侧滑菜单），请参见 scaffold_drawer.dart
        endDrawer: _endDrawer(),                            /// 右侧抽屉（侧滑菜单），请参见 scaffold_drawer.dart

        extendBody: false,                                  /// body 内容是否延伸到底部（即底部导航栏是否要覆盖 body 内容）
        extendBodyBehindAppBar: false,                      /// body 内容是否延伸到顶部（即顶部导航栏是否要覆盖 body 内容）

        persistentFooterButtons: <Widget>[                          /// 底部导航栏上面的一组 widget
          Container(width: 100, height: 20, color: Colors.red,),
          Container(width: 100, height: 20, color: Colors.green,),
          Container(width: 100, height: 20, color: Colors.blue,),
        ],
        persistentFooterAlignment: AlignmentDirectional.center,     /// 底部导航栏上面的一组 widget 的对齐方式

        /// 注：可以为 floatingActionButton 指定任意类型的 widget
        floatingActionButton: Builder(                              /// 悬浮按钮，请参见 scaffold_floating_action_button.dart
          builder: (BuildContext context) {
            return FloatingActionButton(
              child: Text('show'),
              onPressed: () {
                Scaffold.of(context).showBottomSheet((context) {    /// 弹出 BottomSheet（下滑可消失），请参见 scaffold_bottom_sheet.dart
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

        backgroundColor: Colors.orange,   /// 背景色
        resizeToAvoidBottomInset: true,   /// 设置为 true 则会自动滚动，以避免弹出的软键盘遮住输入框的问题
      ),
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