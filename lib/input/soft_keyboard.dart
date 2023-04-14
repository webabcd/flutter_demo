/*
 * 软键盘相关
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class SoftKeyboardDemo extends StatefulWidget {
  const SoftKeyboardDemo({Key? key}) : super(key: key);

  @override
  _SoftKeyboardDemoState createState() => _SoftKeyboardDemoState();
}

/// 通过 WidgetsBindingObserver 可以监听软键盘的显示与隐藏
class _SoftKeyboardDemoState extends State<SoftKeyboardDemo> with WidgetsBindingObserver {

  String message = '';

  @override
  void initState() {
    /// 注册监听
    WidgetsBinding.instance.addObserver(this);
    super.initState();

  }

  @override
  void dispose() {
    /// 移除监听
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// 页面尺寸变化时的回调（来自 WidgetsBindingObserver）
  @override
  void didChangeMetrics() {
    /// 页面重新渲染完成后
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        /// MediaQuery.of(context).viewInsets.bottom 就是当前软键盘的高度，大于 0 就是显示状态，否则就是隐藏状态
        message = "软键盘的高度: ${MediaQuery.of(context).viewInsets.bottom}";
      });
    });
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      /// resizeToAvoidBottomInset - 设置为 true 则会自动滚动，以避免弹出的软键盘遮住输入框的问题
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          TextField(),
          MyButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Text("关闭软键盘"),
          ),
          MyTextSmall(message),
        ],
      ),
    );
  }
}