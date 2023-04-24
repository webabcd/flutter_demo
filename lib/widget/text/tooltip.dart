/*
 * Tooltip - 长按提示或鼠标悬浮提示
 *
 * 注：Tooltip 的触发方式默认是长按或鼠标悬浮，也可以通过 triggerMode 改为单击触发或手动触发
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class TooltipDemo extends StatefulWidget {
  const TooltipDemo({Key? key}) : super(key: key);

  @override
  _TooltipDemoState createState() => _TooltipDemoState();
}

class _TooltipDemoState extends State<TooltipDemo> {

  @override
  Widget build(BuildContext context) {
    /// 用于定义 Tooltip 的 key
    final tooltipKey = GlobalKey<TooltipState>();

    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// 在 child 上长按或鼠标悬浮，则显示 message 提示
            const Tooltip(
              message: 'Tooltip message',
              child: MyText('Tooltip child'),
            ),

            Tooltip(
              message: 'Tooltip message',
              child: const MyText('Tooltip child'),
              /// 提示框的文本样式
              textStyle: const TextStyle(
                fontSize: 24,
              ),
              /// 提示框的装饰样式
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: <Color>[Colors.red, Colors.green]),
              ),
              /// 提示框的高
              height: 100,
              /// 提示框的内边距
              padding: const EdgeInsets.all(20),
              /// 提示框的位置是否在下面
              preferBelow: true,
              /// 提示框的垂直方向的偏移距离
              verticalOffset: 0,
              /// 长按或鼠标悬浮超过此值指定的时间后，则显示提示框
              waitDuration: const Duration(seconds: 1),
              /// 提示框显示的时长
              showDuration: const Duration(seconds: 2),
            ),

            Tooltip(
              /// 提示框的内容支持富文本的方式，即通过 TextSpan 设置提示框的内容
              richMessage: const TextSpan(
                text: 'abc',
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: 'xyz',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              child: const MyText('Tooltip child'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
            ),

            Tooltip(
              message: 'Tooltip message',
              child: const MyText('Tooltip child'),
              showDuration: const Duration(seconds: 3),

              /// 定义 Tooltip 的 key
              key: tooltipKey,
              /// Tooltip 的触发模式
              ///   longPress - 长按或鼠标悬浮
              ///   tap - 单击
              ///   manual - 手动
              triggerMode: TooltipTriggerMode.manual,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          /// 手动触发 Tooltip
          tooltipKey.currentState?.ensureTooltipVisible();
        },
        label: const Text('show tooltip'),
      ),
    );
  }
}