/*
 * 命中测试（hit test）
 *
 * hit test 的作用是根据事件的位置收集所有在该位置上的 widget，然后从最底层的节点开始向上将每个节点收集到一个集合中，最后根据这个集合进行事件分发
 * hit test 是在 RenderObject 上实现的
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class HitTestDemo extends StatefulWidget {
  const HitTestDemo({Key? key}) : super(key: key);

  @override
  _HitTestDemoState createState() => _HitTestDemoState();
}

class _HitTestDemoState extends State<HitTestDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// HitTestBehavior.deferToChild - 子被命中了，则监听器被命中，这个是默认值
          /// 对于本例来说
          /// 1、MyText 被命中了，则 GestureDetector 被命中
          /// 2、如果是 Container 中的非 MyText 区域被命中了，则 GestureDetector 不会被命中
          GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const MyText("webabcd"),
            ),
            onTap: () {
              log("onTap: ${currentTimestamp()}");
            },
          ),

          /// HitTestBehavior.opaque - 子被命中或者自己被命中，则监听器被命中
          /// 对于本例来说
          /// 1、MyText 被命中了，则 GestureDetector 被命中
          /// 2、如果是 Container 中的非 MyText 区域被命中了，则 GestureDetector 也会被命中
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const MyText("webabcd"),
            ),
            onTap: () {
              log("onTap: ${currentTimestamp()}");
            },
          ),

          /// 如果 Container 设置了 color 则因为其对应的 _RenderColoredBox 的 behavior 是 HitTestBehavior.opaque
          /// 所以设置了 color 的 Container 的行为与 HitTestBehavior.opaque 一致
          GestureDetector(
            child: Container(
              height: 50,
              color: Colors.green,
              alignment: Alignment.center,
              child: const MyText("webabcd"),
            ),
            onTap: () {
              log("onTap: ${currentTimestamp()}");
            },
          ),

          /// HitTestBehavior.translucent - 与 HitTestBehavior.opaque 的行为一致，并且不会影响同级的上面的节点的命中测试
          /// 对于本例来说
          /// 1、MyText 被命中了，则 onTap2
          /// 2、如果是 Container 中的非 MyText 区域被命中了，则先 onTap2 再 onTap1（如果不是 translucent 则不会走到 onTap1）
          Stack(
            children: [
              Listener(
                child: Container(child: const MyText("webabcd"), width: 300, height: 50, alignment: Alignment.center, color: Colors.red),
                onPointerDown: (event) {
                  log("onTap1: ${currentTimestamp()}");
                },
              ),
              Listener(
                child: Container(child: const MyText("webabcd"), width: 300, height: 50, alignment: Alignment.center),
                onPointerDown: (event) {
                  log("onTap2: ${currentTimestamp()}");
                },
                behavior: HitTestBehavior.translucent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
