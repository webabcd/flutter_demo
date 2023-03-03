/*
 * 状态栏
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class StatusBarDemo extends StatefulWidget {
  const StatusBarDemo({Key? key}) : super(key: key);

  @override
  _StatusBarDemoState createState() => _StatusBarDemoState();
}

class _StatusBarDemoState extends State<StatusBarDemo> {

  late ListView _listView;
  late Widget _widget;

  /// 显示状态栏
  void _statusBarShow() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom] /// 显示状态栏，显示 android 底部导航栏
    );
    setState((){});
  }

  /// 隐藏状态栏
  void _statusBarHide() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]                      /// 隐藏状态栏，显示 android 底部导航栏
    );
    setState((){});
  }

  /// 亮色文字和图标的状态栏（通过 AnnotatedRegion 实现）
  void _statusBarLight() {
    _widget = AnnotatedRegion(
      child: _listView, 
      value: SystemUiOverlayStyle.light, /// 亮色文字和图标
    );
    setState((){});
  }

  /// 暗色文字和图标的状态栏（通过 AnnotatedRegion 实现）
  void _statusBarDark() {
    _widget = AnnotatedRegion(
      child: _listView, 
      value: SystemUiOverlayStyle.dark /// 暗色文字和图标
    );
    setState((){});
  }

  /// 有导航栏，亮色文字和图标的状态栏，状态栏有背景且占位
  void _statusBar1() {
    /// 去掉 android 状态栏的半透明背景
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );

    _widget = Scaffold(
      appBar: AppBar(
        title: MyText("title"),                         /// 导航栏
        backgroundColor: Colors.red,                    /// 导航栏和状态栏的背景色
        systemOverlayStyle: SystemUiOverlayStyle.light, /// 状态栏亮色文字和图标
      ),
      body: _listView, 
    );
    setState((){});
  }

  /// 有导航栏，暗色文字和图标的状态栏，状态栏有背景且占位
  void _statusBar2() {
    /// 去掉 android 状态栏的半透明背景
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );

    _widget = Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,                               /// 无导航栏
        backgroundColor: Colors.red,                    /// 状态栏的背景色
        systemOverlayStyle: SystemUiOverlayStyle.dark,  /// 状态栏暗色文字和图标
      ),
      body: _listView, 
    );
    setState((){});
  }

  /// 无导航栏，状态栏透明且不占位，亮色文字和图标的状态栏
  void _statusBar3() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(  /// 状态栏亮色文字和图标
        statusBarColor: Colors.transparent  /// 去掉 android 状态栏的半透明背景
      )
    );

    _widget = Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        toolbarHeight: 0,                               /// 无导航栏
      ),
      body: _listView, 
      primary: false,                                   /// 状态栏不占位
    );
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
        _item("显示状态栏", () {
          _statusBarShow();
        }),
        _item("隐藏状态栏", () {
          _statusBarHide();
        }),
        _item("亮色文字和图标的状态栏", () {
          _statusBarLight();
        }),
        _item("暗色文字和图标的状态栏", () {
          _statusBarDark();
        }),
        _item("有导航栏，亮色文字和图标的状态栏，状态栏有背景且占位", () {
          _statusBar1();
        }),
        _item("有导航栏，暗色文字和图标的状态栏，状态栏有背景且占位", () {
          _statusBar2();
        }),
        _item("无导航栏，状态栏透明且不占位，亮色文字和图标的状态栏", () {
          _statusBar3();
        }),
        for (var i = 0; i < 100; i++)
          _item("item: $i", null),
        ],
    );

    _statusBarLight();
  }

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}