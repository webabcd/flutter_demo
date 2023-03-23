/*
 * ChoiceChip - Chip 双状态按钮
 */

import 'package:flutter/material.dart';

class ChoiceChipDemo extends StatefulWidget {
  const ChoiceChipDemo({Key? key}) : super(key: key);

  @override
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<ChoiceChipDemo> {

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Center(
        child: ChoiceChip(
          label: Text('text'),                            /// 显示的文本
          labelStyle: TextStyle(color: Colors.white),     /// 显示的文本的样式
          avatar: Icon(Icons.star, color: Colors.yellow), /// 显示的文本的左侧的图标
          padding: EdgeInsets.all(5),                     /// 内间距
          backgroundColor: Colors.blue,                   /// 背景颜色（未选中状态）
          selectedColor: Colors.red,                      /// 背景颜色（选中状态）
          disabledColor: Colors.black,                    /// 按钮无效时的背景颜色（不定义 onSelected 则按钮为无效状态）
          selected: _selected,                            /// 是否是选中状态
          onSelected: (value) {                           /// 单击事件，其中的 value 值用于表示点击后按钮的选中状态
            setState(() {
              _selected = value;
            });
          },

          tooltip: "tooltip",               /// 长按提示或鼠标悬浮提示
          shape: null,                      /// 边框
          side: null,                       /// 边框的大小和颜色
          elevation: 5,                     /// 阴影高度
          pressElevation: 10,               /// 按下后的阴影高度
          shadowColor: Colors.black,        /// 阴影颜色（未选中状态）
          selectedShadowColor: Colors.red,  /// 阴影颜色（选中状态）
        ),
      ),
    );
  }
}