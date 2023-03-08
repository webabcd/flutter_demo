/*
 * Checkbox - 复选框
 *
 * 注：Checkbox 必须放到一个 Material 组件内，否则会报错
 */

import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key? key}) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {

  bool? _checkbox1IsChecked;
  bool _checkbox2IsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            /// 当前复选框的选中状态
            /// 如果 tristate 为 true 则复选框有 3 种状态，分别是 null, false, true
            /// 如果 tristate 为 false 则复选框有 2 种状态，分别是 false, true
            value: _checkbox1IsChecked,
            tristate: true,
            /// 当前复选框的选中状态发生变化时触发的事件
            ///   value - 变化后的状态
            onChanged: (bool? value) {
              setState(() {
                _checkbox1IsChecked = value;
              });
            },
            /// 复选框内的“对钩”或“横线”的颜色
            checkColor: Colors.white,
            /// 为不同的状态设置不同的颜色
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.green;  /// 选中状态为绿色
              }
              return Colors.red;      /// 其他状态为红色
            }),
            /// 边框
            shape: const StadiumBorder(),
          ),
          Checkbox(
            tristate: false,
            value: _checkbox2IsChecked,
            onChanged: (bool? value) {
              setState(() {
                _checkbox2IsChecked = value!;
              });
            },
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.green;
              }
              return Colors.red;
            }),
          ),
        ],
      ),
    );
  }
}