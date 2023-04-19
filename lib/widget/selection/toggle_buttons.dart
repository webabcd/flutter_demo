/*
 * ToggleButtons - 一组多状态按钮
 */

import 'package:flutter/material.dart';

class ToggleButtonsDemo extends StatefulWidget {
  const ToggleButtonsDemo({Key? key}) : super(key: key);

  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}

class _ToggleButtonsDemoState extends State<ToggleButtonsDemo> {

  final _isSelectedList = [false, false, false];
  final _isSelectedList2 = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// 用于定义一组多状态按钮
            ToggleButtons(
              /// 用于定义组内每个按钮的选中状态
              isSelected: _isSelectedList,
              /// 用于定义组内每个按钮
              children: const [
                Text("aa"),
                Text("bb"),
                Text("cc"),
              ],
              /// 组内的按钮被点击后（index 为被点击的按钮在组内的索引位置）
              onPressed: (index) {
                setState(() {
                  _isSelectedList[index] = !_isSelectedList[index];
                });
              },
            ),

            ToggleButtons(
              /// 是否显示边框
              renderBorder: true,
              /// 边框大小
              borderWidth: 3.0,
              /// 边框圆角的半径
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              /// 边框颜色
              borderColor: Colors.red,
              /// ToggleButtons 为不可用状态时的边框颜色（onPressed 为 null 则代表 ToggleButtons 为不可用状态）
              disabledBorderColor: Colors.black,

              /// 按钮的文本样式
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              /// 按钮未选中时的文本颜色
              color: Colors.yellow,
              /// 按钮选中时的文本颜色
              selectedColor: Colors.green,
              /// 按钮选中时的背景颜色
              fillColor: Colors.white,
              /// 单击按钮时的水波纹效果的颜色
              splashColor: Colors.blue,
              /// ToggleButtons 为不可用状态时的文本颜色（onPressed 为 null 则代表 ToggleButtons 为不可用状态）
              disabledColor: Colors.black,

              /// 用于限制按钮的尺寸
              constraints: const BoxConstraints(minWidth: 64, minHeight: 64),

              isSelected: _isSelectedList2,
              children: const [
                Text("aa"),
                Text("bb"),
                Text("cc"),
              ],
              onPressed: (index) {
                setState(() {
                  _isSelectedList2[index] = !_isSelectedList2[index];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}