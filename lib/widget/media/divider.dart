/*
 * Divider - 分隔线
 */

import 'package:flutter/material.dart';

class DividerDemo extends StatefulWidget {
  const DividerDemo({Key? key}) : super(key: key);

  @override
  _DividerDemoState createState() => _DividerDemoState();
}

class _DividerDemoState extends State<DividerDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Center(
        child: Container(
          color: Colors.blue,
          child: const Divider(
            height: 200,        /// Divider 组件的高度（不是实际分隔线的高度）
            thickness: 20,      /// 分隔线的高度，会在 Divider 组件的中间绘制此直线
            color: Colors.red,  /// 分隔线的颜色
            indent: 10,         /// 分隔线左侧的缩进值
            endIndent: 10,      /// 分隔线右侧的缩进值
          ),
        ),
      ),
    );
  }
}