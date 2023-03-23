/*
 * InputChip - Chip 双状态按钮（选中时有对钩，文字右边有删除按钮）
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class InputChipDemo extends StatefulWidget {
  const InputChipDemo({Key? key}) : super(key: key);

  @override
  _InputChipDemoState createState() => _InputChipDemoState();
}

class _InputChipDemoState extends State<InputChipDemo> {

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Center(
        child: InputChip(
          label: Text('text'),                            /// 显示的文本
          labelStyle: TextStyle(color: Colors.white),     /// 显示的文本的样式
          avatar: CircleAvatar(                           /// 显示的文本的左侧的图标
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            child: Text("W"),
          ),
          padding: EdgeInsets.all(5),                     /// 内间距
          backgroundColor: Colors.blue,                   /// 背景颜色（未选中状态）
          selectedColor: Colors.red,                      /// 背景颜色（选中状态）
          disabledColor: Colors.black,                    /// 按钮无效时的背景颜色
          isEnabled: true,                                /// 按钮是否是有效状态

          selected: _selected,                            /// 是否是选中状态
          onSelected: (value) {                           /// 单击事件，其中的 value 值用于表示点击后按钮的选中状态
            setState(() {
              _selected = value;
            });
          },
          /*
          onPressed: () {                                 /// 单击事件（注：onSelected 和 onPressed 只能有一个）
            showToast(context, "onPressed");
          },
          */

          deleteIcon: Icon(Icons.close, color: Colors.orange),  /// 文本右侧的删除按钮的图标
          deleteButtonTooltipMessage: "tooltip",                /// 在删除按钮上的长按提示或鼠标悬浮提示
          onDeleted: () {                                       /// 点击删除按钮后触发的事件
            showToast(context, "onDeleted");
          },

          showCheckmark: true,              /// 选中时是否需要在文本的左侧显示”对钩“
          checkmarkColor: Colors.black,     /// ”对钩“的颜色

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