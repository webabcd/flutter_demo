/*
 * Chip - Chip（背景上有文字，文字左边有图标，文字右边有删除按钮）
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({Key? key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Center(
        child: Chip(
          label: Text('text'),                            /// 显示的文本
          labelStyle: TextStyle(color: Colors.white),     /// 显示的文本的样式
          avatar: CircleAvatar(                           /// 显示的文本的左侧的图标
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            child: Text("W"),
          ),
          padding: EdgeInsets.all(5),                     /// 内间距
          backgroundColor: Colors.blue,                   /// 背景颜色

          deleteIcon: Icon(Icons.close, color: Colors.red), /// 文本右侧的删除按钮的图标
          deleteButtonTooltipMessage: "tooltip",            /// 在删除按钮上的长按提示或鼠标悬浮提示
          onDeleted: () {                                   /// 点击删除按钮后触发的事件
            showToast(context, "onDeleted");
          },

          elevation: 10,                  /// 阴影高度
          shadowColor: Colors.black,      /// 阴影颜色
          side: null,                     /// 边框的大小和颜色
          shape: RoundedRectangleBorder(  /// 边框
            side: const BorderSide(width: 2, color: Colors.green),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}