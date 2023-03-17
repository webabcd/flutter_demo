/*
 * 状态管理 - 在树上，子获取父的数据
 *
 * 在树上，子通过 context 的 findAncestorWidgetOfExactType(), findAncestorStateOfType() 查找父
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class FindAncestorDemo extends StatefulWidget {
  const FindAncestorDemo({Key? key}) : super(key: key);

  final myName = "webabcd";

  @override
  _FindAncestorDemoState createState() => _FindAncestorDemoState();
}

class _FindAncestorDemoState extends State<FindAncestorDemo> {

  final myAge = 44;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// 在 State<T> 中调用相关的 StatefulWidget 中的属性或方法
            MyText(widget.myName),
            MyWidget(),
          ],
        ),
      ),
    );
  }
}


class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  @override
  Widget build(BuildContext context) {

    /// findAncestorWidgetOfExactType() - 用于一层一层地向上查找需要的 Widget
    var parentWidget = context.findAncestorWidgetOfExactType<FindAncestorDemo>()!;
    /// findAncestorStateOfType() - 用于一层一层地向上查找需要的 State
    var parentState = context.findAncestorStateOfType<_FindAncestorDemoState>()!;

    /// 在树上，子获取父的数据
    return MyText("${parentWidget.myName}, ${parentState.myAge}");
  }
}
