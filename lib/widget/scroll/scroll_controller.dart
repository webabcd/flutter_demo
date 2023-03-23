/*
 * ScrollController - 用于控制可滚动组件和滚动条
 *
 * ScrollController 会控制相关的可滚动组件和滚动条之间的联动，也可以监听滚动事件，通过程序滚动到指定位置等
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ScrollControllerDemo extends StatefulWidget {
  const ScrollControllerDemo({Key? key}) : super(key: key);

  @override
  _ScrollControllerDemoState createState() => _ScrollControllerDemoState();
}

class _ScrollControllerDemoState extends State<ScrollControllerDemo> {

  final String _string = "012345678901234567890123456789012345678901234567890123456789";
  final ScrollController _controller = ScrollController();

  String _message = "";

  @override
  void initState() {
    super.initState();

    /// 滚动发生时触发的事件
    _controller.addListener(() {
      setState(() {
        /// 获取当前的滚动位置
        _message = "offset:${_controller.offset.toStringAsFixed(2)}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyText(_message),
          Flexible(
            child: Scrollbar(
              /// 指定 Scrollbar 关联的 ScrollController
              controller: _controller,
              child: SingleChildScrollView(
                /// 指定 SingleChildScrollView 关联的 ScrollController
                controller: _controller,
                child: Center(
                  child: Column(
                    children:_string.split("").map((c) => MyText(c)).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        MyButton(
          onPressed: () {
            /// animateTo() - 通过动画的方式滚动到指定的位置
           _controller.animateTo(100, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
          },
          child: const Text("animateTo()"),
        ),
        MyButton(
          onPressed: () {
            /// jumpTo() - 直接跳转到指定的位置（无滚动动画）
            _controller.jumpTo(100);
          },
          child: const Text("jumpTo()"),
        ),
      ],
    );
  }
}