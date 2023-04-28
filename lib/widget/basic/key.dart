/*
 * Key - 键
 *
 * LocalKey 和 GlobalKey 用于让 element 找到 widget
 * GlobalKey 也可以用于获取对应的 Widget/State/RenderObject
 *
 * 1、LocalKey - 这是一个抽象类，用于标识 Widget，要求在 widget 树中同一级必须唯一
 *   a) ValueKey - 值类型的 LocalKey，判断 key 是否相同时按照值是否相等判断
 *   b) ObjectKey - 引用类型的 LocalKey，判断 key 是否相同时按照指针是否相等判断
 *   c) UniqueKey - 自动生成的唯一 LocalKey，每次都会生成不同的唯一 key
 * 2、GlobalKey - 用于标识 Widget，要求在整个应用程序中必须唯一
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';


class KeyDemo extends StatefulWidget {
  const KeyDemo({Key? key}) : super(key: key);

  @override
  _KeyDemoState createState() => _KeyDemoState();
}

class _KeyDemoState extends State<KeyDemo> {

  /// 没有指定 key
  List<Widget> widgets1 = [
    _MyStatefulWidget(color: Colors.red),
    _MyStatefulWidget(color: Colors.green),
  ];

  /// 指定了 ValueKey
  /// ValueKey, ObjectKey 要求在树的同一级上必须唯一
  /// 如果是 UniqueKey 的话，则每次 Widget 树变化后，都会生成唯一的 key，所以原 Element 找不到 key 相同的 Widget，所以就会重新创建新的 Element，原 Element 会被销毁
  List<Widget> widgets2 = [
    _MyStatefulWidget(color: Colors.red, key: ValueKey(1),),
    _MyStatefulWidget(color: Colors.green, key: ValueKey(2),),
  ];

  /// 指定了 GlobalKey
  List<Widget> widgets3 = [
    _MyStatefulWidget(color: Colors.red, key: GlobalKey(),),
    _MyStatefulWidget(color: Colors.green, key: GlobalKey(),),
  ];

  /// 指定了 GlobalKey
  /// 如果定义了 GlobalKey<T> 中的 T 则，则后续通过 GlobalKey 的 currentState 就能直接拿到类型为 T 的 State
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey<_MyStatefulWidgetState> _globalKey2 = GlobalKey<_MyStatefulWidgetState>();
  List<Widget> widgets4 = [ ];

  @override
  void initState() {
    super.initState();

    widgets4 = [
      _MyStatefulWidget(color: Colors.red, key: _globalKey1,),
      _MyStatefulWidget(color: Colors.green, key: _globalKey2,),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets1,
          ),
          onTap: () {
            /// 颜色会调换，数字不会调换
            /// 因为颜色保存在 Widget 中，数字保存在 State 中（注：State 是保存在 Element 树中的）
            /// Widget 树变化后，Element 会从同级树的同样的位置开始找类型相同的 Widget（不会在父级或子级查找）
            widgets1.insert(0, widgets1.removeAt(1));
            setState(() {});
          },
        ),

        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets2,
          ),
          onTap: () {
            /// 颜色会调换，数字也会调换
            /// Widget 树变化后，Element 会从同级树的同样的位置开始找 key 相同的 Widget（不会在父级或子级查找）
            widgets2.insert(0, widgets2.removeAt(1));
            setState(() {});
          },
        ),

        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets3,
          ),
          onTap: () {
            /// 颜色会调换，数字也会调换
            /// Widget 树变化后，Element 会从整个应用程序中找 key 相同的 Widget（即使层级发生变化也能找到）
            widgets3.insert(0, Center(child: widgets3.removeAt(1)));
            setState(() {});
          },
        ),

        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets4,
          ),
          onTap: () {
            widgets4.insert(0, widgets4.removeAt(1));

            /// 通过 GlobalKey 可以获取对应的 Widget/State/RenderObject
            var widget = _globalKey1.currentWidget as _MyStatefulWidget;
            var state = _globalKey1.currentState as _MyStatefulWidgetState;
            var box = _globalKey1.currentContext?.findRenderObject() as RenderBox;
            log("color:${widget.color}, state:${state._number}, globalOffset:${box.localToGlobal(Offset.zero)}, size:${box.size}");

            /// 如果定义 GlobalKey 时指定了 GlobalKey<T> 中的 T 则这里通过 currentState 就能直接拿到类型为 T 的 State
            var _ = _globalKey2.currentState?._number;

            setState(() {});
          },
        ),
      ],
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {

  final Random _random = Random();
  int _number = 0;

  @override
  void initState() {
    super.initState();

    _number = _random.nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      color: widget.color,
      child: MyText("$_number"),
    );
  }
}