/*
 * AppBar - 顶部导航栏
 *
 * 一般在 Scaffold 中使用 AppBar
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
        automaticallyImplyLeading: true,                  /// 当没有指定 leading 时，是否自动显示左侧的返回按钮并自动实现返回按钮的逻辑
        /// leading: const Icon(Icons.arrow_back_ios),    /// 左侧按钮
        /// leadingWidth: 100,                            /// 左侧按钮占位的宽度
        title: const Text('title'),                       /// title
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
        flexibleSpace: FlexibleSpaceBar(title: MyText("flexibleSpace"),),     ///
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('bottom'),
        ),
        shape: BeveledRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(0)
        ),
// http://events.jianshu.io/p/20851a96b92f
        backgroundColor: Colors.green,
        shadowColor: Colors.black,
        elevation: 100,
        foregroundColor: Colors.red,

        primary: _primary,
        centerTitle: false,
        titleSpacing: 20,
        toolbarOpacity: 1,
        bottomOpacity: 1,
        //toolbarHeight: 100,



        toolbarTextStyle: TextStyle(color: Colors.purple),
        titleTextStyle: TextStyle(color: Colors.purple),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
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