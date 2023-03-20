/*
 * SafeArea - 安全区域
 * 实际上就是一个 padding，然后把刘海屏、全面屏、异形屏等中的非安全区放到 padding 的空隙中
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class SafeAreaDemo extends StatefulWidget {
  const SafeAreaDemo({Key? key}) : super(key: key);

  @override
  _SafeAreaDemoState createState() => _SafeAreaDemoState();
}

class _SafeAreaDemoState extends State<SafeAreaDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      /// SafeArea - 安全区域（实际上就是一个 padding，然后把刘海屏、全面屏、异形屏等中的非安全区放到 padding 的空隙中）
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// MediaQuery.of(context).size - 获取设备的逻辑分辨率
                /// MediaQuery.of(context).padding - 获取设备的安全区域的 padding（实际上 SafeArea 就是基于此的）
                MyTextSmall("${MediaQuery.of(context).size}, ${MediaQuery.of(context).padding}"),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
        /// top/bottom/left/right - 是否需要把上下左右的安全区域空出来
        top: true,
        bottom: true,
        left: true,
        right: true,
        /// minimum - 设置 padding 的最小空隙
        minimum: EdgeInsets.zero,
        /// maintainBottomViewPadding - 是否保持底部的空隙值不变，默认值为 false
        ///   比如如果弹出软键盘的话：
        ///   当此值为 false 时，则底部的空隙值变为零
        ///   当此值为 true 时，则底部的空隙值与无软键盘时一致
        maintainBottomViewPadding: false,
      ),
    );
  }
}
