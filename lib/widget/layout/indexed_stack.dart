/*
 * IndexedStack - 从多个子中选择一个显示
 *
 * IndexedStack 继承自 Stack，请先参看 stack.dart 中的说明
 */

import 'package:flutter/material.dart';

class IndexedStackDemo extends StatelessWidget {
  const IndexedStackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.orange,
        child: IndexedStack(
          /// 用于指定需要显示的元素的索引位置
          index: 1, /// 只显示第 2 个元素
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}