/*
 * android 底部导航栏
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationBarDemo extends StatefulWidget {
  const NavigationBarDemo({Key? key}) : super(key: key);

  @override
  _NavigationBarDemoState createState() => _NavigationBarDemoState();
}

class _NavigationBarDemoState extends State<NavigationBarDemo> {

  late ListView _listView;
  late Widget _widget;

  /// 显示 android 底部导航栏
  void _navigationBarShow() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom] /// 显示状态栏，显示 android 底部导航栏
    );
    setState((){});
  }

  /// 隐藏 android 底部导航栏
  void _navigationBarHide() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]                         /// 显示状态栏，隐藏 android 底部导航栏
    );
    setState((){});
  }

  /// 有背景色的 android 底部导航栏
  void _navigationBar1() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.blue, /// android 底部导航栏的背景色
      )
    );

    _widget = _listView;
    setState((){});
  }

  /// 透明的 android 底部导航栏且不占位
  void _navigationBar2() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Colors.transparent, /// android 底部导航栏的背景色
        )
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge                           /// 状态栏和 android 底部导航栏不占位
    );

    _widget = _listView;
    setState((){});
  }

  Widget _item(String title, GestureTapCallback? onTap) {
    return GestureDetector(
        child: Container(
          color: Colors.orange,
          child: Text(
            title,
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        onTap: onTap
    );
  }

  @override
  void initState() {
    super.initState();

    _listView = ListView(
      scrollDirection: Axis.vertical,
      itemExtent: 60,
      children: [
        _item("显示 android 底部导航栏", () {
          _navigationBarShow();
        }),
        _item("隐藏 android 底部导航栏", () {
          _navigationBarHide();
        }),
        _item("有导航栏，亮色文字和图标的状态栏，状态栏有背景且占位", () {
          _navigationBar1();
        }),
        _item("有导航栏，暗色文字和图标的状态栏，状态栏有背景且占位", () {
          _navigationBar2();
        }),
        for (var i = 0; i < 100; i++)
          _item("item: $i", null),
      ],
    );

    _navigationBar1();
  }

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}