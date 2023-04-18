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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// 通过 Listener 监听指针事件
            Listener(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 100,
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

            /// 用于演示指针事件的冒泡，如果不需要冒泡的话请用手势事件
            Listener(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 100,
                alignment: Alignment.center,
                child:Listener(
                  child: Container(
                    color: Colors.green,
                    width: 100,
                    height: 50,
                  ),
                  onPointerDown: (event) {
                    log('onPointerDown green: ${event.position}, ${event.localPosition}');
                  },
                ),
              ),
              onPointerDown: (event) {
                log('onPointerDown red: ${event.position}, ${event.localPosition}');
              },
            ),

            Listener(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 100,
                alignment: Alignment.center,
                /// 禁止响应指针事件，但是会冒泡
                child:IgnorePointer(
                  ignoring: true,
                  child: Listener(
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 50,
                    ),
                    onPointerDown: (event) {
                      log('onPointerDown green: ${event.position}, ${event.localPosition}');
                    },
                  ),
                ),
              ),
              onPointerDown: (event) {
                log('onPointerDown red: ${event.position}, ${event.localPosition}');
              },
            ),

            Listener(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 100,
                alignment: Alignment.center,
                /// 禁止响应指针事件，并且不会冒泡
                child:AbsorbPointer(
                  absorbing: true,
                  child: Listener(
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 50,
                    ),
                    onPointerDown: (event) {
                      log('onPointerDown green: ${event.position}, ${event.localPosition}');
                    },
                  ),
                ),
              ),
              onPointerDown: (event) {
                log('onPointerDown red: ${event.position}, ${event.localPosition}');
              },
            ),
          ],
        ),
      ),
    );
  }
}