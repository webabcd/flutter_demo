/*
 * RawKeyboardListener - 按键
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/helper.dart';

class RawKeyboardListenerDemo extends StatefulWidget {
  const RawKeyboardListenerDemo({Key? key}) : super(key: key);

  @override
  _RawKeyboardListenerDemoState createState() => _RawKeyboardListenerDemoState();
}

class _RawKeyboardListenerDemoState extends State<RawKeyboardListenerDemo> {

  final FocusNode _focusNode = FocusNode();

  double _translationX = 0;
  double _translationY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// 通过 RawKeyboardListener 监听按键事件
        /// 注：前提是要获取焦点才可以
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: _focusNode,
          onKey: (RawKeyEvent event){
            /// 按键按下
            if (event is RawKeyDownEvent) {
              /// 获取按键的字符串值
              log("keyDown keyLabel: " + event.logicalKey.keyLabel);
            }
            /// 按键抬起
            else if (event is RawKeyUpEvent) {
              /// 获取按键的字符串值
              log("keyUp keyLabel: " + event.logicalKey.keyLabel);
            }

            /// 是否是按键按下后没有抬起而产生的重复事件
            // event.repeat;
            /// 当前是否按下了 alt 键
            // event.isAltPressed;
            /// 当前是否按下了 ctrl 键
            // event.isControlPressed;
            /// 当前是否按下了 shift 键
            // event.isShiftPressed;

            /// 获取按键的 keyCode 要区分不同的平台（RawKeyEventDataAndroid, RawKeyEventDataIos, RawKeyEventDataWeb, RawKeyEventDataWindows 等）
            if (event.data is RawKeyEventDataAndroid) {
              RawKeyEventDataAndroid dataAndroid = event.data as RawKeyEventDataAndroid;
              var keyCode = dataAndroid.keyCode;
            } else if (event.data is RawKeyEventDataWindows) {
              RawKeyEventDataAndroid dataWindows = event.data as RawKeyEventDataAndroid;
              var keyCode = dataWindows.keyCode;
            }

            /// 通过上下左右键控制小方块的位置
            setState(() {
              if (event.logicalKey.keyLabel == "Arrow Down") {
                _translationY += 1;
              } else if (event.logicalKey.keyLabel == "Arrow Up") {
                _translationY -= 1;
              } else if (event.logicalKey.keyLabel == "Arrow Left") {
                _translationX -= 1;
              } else if (event.logicalKey.keyLabel == "Arrow Right") {
                _translationX += 1;
              }
            });
          },
          child: Transform(
            transform: Matrix4.translationValues(_translationX, _translationY, 0),
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}