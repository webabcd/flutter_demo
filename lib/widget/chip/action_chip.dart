/*
 * ActionChip - Chip 按钮
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ActionChipDemo extends StatefulWidget {
  const ActionChipDemo({Key? key}) : super(key: key);

  @override
  _ActionChipDemoState createState() => _ActionChipDemoState();
}

class _ActionChipDemoState extends State<ActionChipDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Center(
        child: ActionChip(
          label: Text('text'),                            /// 显示的文本
          labelStyle: TextStyle(color: Colors.white),     /// 显示的文本的样式
          avatar: Icon(Icons.star, color: Colors.yellow), /// 显示的文本的左侧的图标
          padding: EdgeInsets.all(5),                     /// 内间距
          backgroundColor: Colors.blue,                   /// 背景颜色
          disabledColor: Colors.black,                    /// 按钮无效时的背景颜色（不定义 onPressed 则按钮为无效状态）
          onPressed: () {                                 /// 单击事件
            showToast(context, "onPressed");
          },

          tooltip: "tooltip",         /// 长按提示或鼠标悬浮提示
          shape: null,                /// 边框
          side: null,                 /// 边框的大小和颜色
          elevation: 0,               /// 阴影高度
          pressElevation: 5,          /// 按下后的阴影高度
          shadowColor: Colors.black,  /// 阴影颜色
        ),
      ),
    );
  }
}