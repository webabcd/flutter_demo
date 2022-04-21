/*
 * 焦点
 *
 * flutter 的 UI 部分是声明式 UI，不是传统的命令式编程，有一个缺点就是不方便命令一个 Widget 去做一些事情
 * 比如你想通过一个按钮控制一个输入框是否获取焦点，就需要借助 focusNode 实现
 * 比如你想通过一个按钮控制一个输入框的值，就需要借助 controller 实现
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class FocusDemo extends StatefulWidget {
  const FocusDemo({Key? key}) : super(key: key);

  @override
  _FocusDemoState createState() => _FocusDemoState();
}

class _FocusDemoState extends State<FocusDemo> {

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            /// focusNode - 用于以命令方式控制 TextField 的焦点
            focusNode: _focusNode,
            /// controller - 用于以命令方式控制 TextField 的值
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 5, color: Colors.orange),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          TextButton(
            /// autofocus - 是否自动获取焦点
            autofocus: true,
            /// onFocusChange - 焦点变化时触发的事件
            onFocusChange: (isFocus) {
              log("TextButton isFocus: $isFocus");
            },
            onPressed: () {
              /// 以命令方式控制 TextField 的值
              _controller.text = DateTime.now().toString();

              /// 以命令方式控制 TextField 的焦点
              if (_focusNode.hasFocus) {
                _focusNode.nextFocus(); // 让 TextButton 获取焦点
              } else {
                FocusScope.of(context).requestFocus(_focusNode); // 让 TextField 获取焦点
              }
            },
            child: Text("修改 TextField 的值，并在 TextField 和 TextButton 间切换焦点"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                /// 获取焦点时的背景色
                if (states.contains(MaterialState.focused)) {
                  return Colors.green;
                }
                /// 正常状态的背景色
                return Colors.blue;
              }),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}