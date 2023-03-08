/*
 * Radio - 单选框
 *
 * 注：Radio 必须放到一个 Material 组件内，否则会报错
 */

import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {

  String? _groupValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// Radio<T> 中的 T 用于指定 Radio 中的 value 的类型
          Radio<String>(
            /// 当前选项的值
            value: "value1",
            /// 当前选项组的被选中的选项的值
            groupValue: _groupValue,
            /// 当前选项组的选中状态发生变化时触发的事件
            ///   value - 被选中的选项的值
            onChanged: (String? value) {
              setState(() {
                _groupValue = value;
              });
            },
            /// 为不同的状态设置不同的颜色
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.green;  /// 选中状态为绿色
              }
              return Colors.red;      /// 其他状态为红色
            }),
          ),
          Radio<String>(
            value: "value2",
            groupValue: _groupValue,
            onChanged: (String? value) {
              setState(() {
                _groupValue = value;
              });
            },
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