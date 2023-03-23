/*
 * Switch - 开关
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key? key}) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {

  bool _selected1 = true;
  bool _selected2 = true;
  bool _selected3 = true;
  bool _selected4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Switch(
            /// 开关是否打开
            value: _selected1,
            /// 开启状态时滑块的颜色
            activeColor: Colors.red,
            /// 开启状态时轨道的颜色
            activeTrackColor: Colors.green,
            /// 关闭状态时滑块的颜色
            inactiveThumbColor: Colors.blue,
            /// 关闭状态时轨道的颜色
            inactiveTrackColor: Colors.yellow,
            /// 开关状态发生变化时触发的事件
            onChanged:(value) {
              setState(() {
                _selected1 = value;
              });
            },
          ),
          Switch(
            value: _selected2,
            /// 开启状态时滑块的图片
            activeThumbImage: const AssetImage('assets/dialog.png'),
            /// 关闭状态时滑块的图片
            inactiveThumbImage: const AssetImage('assets/son.jpg'),
            onChanged:(value) {
              setState(() {
                _selected2 = value;
              });
            },
          ),

          /// CupertinoSwitch - iOS 风格的开关
          CupertinoSwitch(
            value: _selected3,
            onChanged:(value) {
              setState(() {
                _selected3 = value;
              });
            },
          ),

          /// Switch.adaptive - 风格自适应（在 iOS 系统则渲染为 iOS 风格的开关，其他系统则渲染为 Material Design 风格的开关）
          Switch.adaptive(
            value: _selected4,
            onChanged:(value) {
              setState(() {
                _selected4 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}