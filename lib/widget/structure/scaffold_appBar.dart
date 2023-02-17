/*
 * AppBar - 顶部导航栏（一般在 Scaffold 中使用）
 *
 * AppBar 分为 toolbar 和 bottom 两部分，bottom 显示在 toolbar 下面
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class ScaffoldAppBarDemo extends StatefulWidget {
  const ScaffoldAppBarDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldAppBarDemoState createState() => _ScaffoldAppBarDemoState();
}

class _ScaffoldAppBarDemoState extends State<ScaffoldAppBarDemo> {
  var _primary = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// toolbarHeight: 100,                           /// toolbar 的高度
        backgroundColor: Colors.green,                    /// 背景颜色
        shadowColor: Colors.black,                        /// 阴影颜色
        elevation: 10,                                    /// 阴影高度
        leading: Builder(                                 /// 左侧按钮
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () { Navigator.of(context).pop(); },
            );
          },
        ),
        leadingWidth: 80,                                 /// 左侧按钮占位的宽度
        /// automaticallyImplyLeading: true,              /// 当没有指定 leading 时，是否自动显示左侧的返回按钮并自动实现返回按钮的逻辑
        foregroundColor: Colors.orange,                   /// 文本或图标按钮的颜色
        title: const Text('title'),                       /// title
        titleTextStyle: TextStyle(color: Colors.red),     /// title 的颜色
        centerTitle: true,                                /// title 是否居中（不居中则居左）
        titleSpacing: 20,                                 /// title 居左显示时，其位置的左侧偏移量
        toolbarTextStyle: TextStyle(),                    /// toolbar 上左侧按钮和右侧按钮的文本样式
        actions: <Widget>[                                /// 右侧的按钮集合
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () { },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () { },
          ),
        ],
        shape: BeveledRectangleBorder(                    /// appBar 的 shape
            side: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(0)
        ),
        toolbarOpacity: 1,                                /// toolbar 中的内容的不透明度
        bottom: AppBar(                                   /// bottom 是 toolbar 下显示的 widget
          automaticallyImplyLeading: false,
          title: const Text('bottom'),
        ),
        bottomOpacity: 1,                                 /// bottom 中的内容的不透明度
        primary: _primary,                                /// 内容是否需要为了避免遮挡 statusBar 而往下偏移
        systemOverlayStyle: const SystemUiOverlayStyle(   /// 系统遮盖层的样式（系统遮盖层包括顶部状态栏和底部导航栏）
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent
        ),
      ),
      body: Center(
        child: MyButton(
          child: MyText("primary: $_primary"),
          onPressed: () {
            setState(() {
              _primary ^= true;
            });
          },
        ),
      ),
    );
  }
}