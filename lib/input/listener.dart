/*
 * Listener - 指针
 *
 * 指针事件是原始的
 * 手势事件封装了指针事件，其用于描述具有特殊语义的操作
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ListenerDemo extends StatefulWidget {
  const ListenerDemo({Key? key}) : super(key: key);

  @override
  _ListenerDemoState createState() => _ListenerDemoState();
}

class _ListenerDemoState extends State<ListenerDemo> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        /// 通过 Listener 监听指针事件
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 300,
            height: 300,
          ),
          /// 按下
          onPointerDown: (event) { /// event 是一个 PointerDownEvent 对象
            /// position - 相对于屏幕的位置
            /// localPosition - 相对于父的位置
            log('onPointerDown: ${event.position}, ${event.localPosition}');
          },
          /// 按下后移动
          onPointerMove: (event) { /// event 是一个 PointerMoveEvent 对象
            /// delta - 两次事件之间的 position 的差值
            /// localDelta - 两次事件之间的 localPosition 的差值
            log('onPointerMove: ${event.position}, ${event.delta}, ${event.localPosition}, ${event.localDelta}');
          },
          /// 抬起
          onPointerUp: (event) { /// event 是一个 PointerUpEvent 对象
            log('onPointerUp: ${event.position}, ${event.localPosition}');
          },
        ),
      ),
    );
  }
}