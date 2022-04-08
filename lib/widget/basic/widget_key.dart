/*
 * Widget 的 key 与三棵树
 *
 * Flutter 中的三棵树
 * 1、Widget 树
 *   Widget 是一个用来描述 UI 的配置
 * 2、RenderObject 树
 *   RenderObject 是用于渲染的对象
 * 3、Element 树
 *   Element 是 Widget 实例化出的对象，它是 Widget 和 RenderObject 之间的桥梁
 *   Element 会持有其对应的 Widget
 *   如果 Element 是需要渲染的，则会通过 Widget 生成 RenderObject 对象
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class WidgetKeyDemo extends StatefulWidget {
  const WidgetKeyDemo({Key? key}) : super(key: key);

  @override
  _WidgetKeyDemoState createState() => _WidgetKeyDemoState();
}

class _WidgetKeyDemoState extends State<WidgetKeyDemo> {
  /// 颜色信息保存在 Widget 中
  List<Widget> widgets1 = [
    _MyStatefulWidget(color: Colors.red, type: 0),
    _MyStatefulWidget(color: Colors.green, type: 0),
  ];

  /// 颜色信息保存在 Widget 的 State 中
  List<Widget> widgets2 = [
    _MyStatefulWidget(color: Colors.red, type: 1, key: UniqueKey()),
    _MyStatefulWidget(color: Colors.green, type: 1, key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets1
          ),
          onTap: () {
            /// 交换两个 Widget 的位置，颜色信息保存在 Widget 中
            /// 在 Widget 树中，两个 Widget 的位置对调了
            /// 此时 Element 树没有变化，每个 Element 持有的 Widget 的地址也没有变化
            /// 但是因为两个 Widget 对调了，所以第 1 个 Element 持有了原来第 2 个 Widget，第 2 个 Element 持有了原来第 1 个 Widget
            /// Element 会调用持有的 Widget 的 canUpdate() 方法，其会判断新老 Widget 的 key 和 runtimeType 是否相同（注：如果没指定 Widget 的 key 则认为 key 是相同的）
            /// 然后发现 key 和 runtimeType 均相同，所以第 1 个 Element 就认为其持有原来的第 2 个 Widget 是合法的
            /// 因为使用的颜色信息是保存在 Widget 中的，所以随着 Widget 的对调，颜色也对调了
            widgets1.insert(0, widgets1.removeAt(1));
            setState(() {});
          },
        ),
        GestureDetector(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets2
          ),
          onTap: () {
            /// 交换两个 Widget 的位置，颜色信息保存在 Widget 的 State 中（注：State 是保存在 Element 树中的）
            /// 在 Widget 树中，两个 Widget 的位置对调了
            /// 此时 Element 树没有变化，每个 Element 持有的 Widget 的地址也没有变化
            /// 但是因为两个 Widget 对调了，所以第 1 个 Element 持有了原来第 2 个 Widget，第 2 个 Element 持有了原来第 1 个 Widget
            /// Element 会调用持有的 Widget 的 canUpdate() 方法，其会判断新老 Widget 的 key 和 runtimeType 是否相同（注：如果没指定 Widget 的 key 则认为 key 是相同的）
            ///   1、如果你没有为 Widget 指定不同的 key，则 key 和 runtimeType 均相同，所以第 1 个 Element 就认为其持有原来的第 2 个 Widget 是合法的
            ///   因为使用的颜色信息是保存在 Widget 的 State 中的，所以虽然 Widget 对调了，但是颜色不会对调
            ///   2、如果你为 Widget 指定了不同的 key，则因为 key 是不同的，所以第 1 个 Element 就认为其持有原来的第 2 个 Widget 是不合法的
            ///   然后 Element 就会在 Widget 树种查找，看看有没有和之前的 Widget 的 key 和 runtimeType 都相同的
            ///   结果找到了，然后第 1 个 Element 就持有了原来的第 1 个 Widget，所以随着 Widget 的对调，颜色也对调了
            widgets2.insert(0, widgets2.removeAt(1));
            setState(() {});
          },
        )
      ],
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  final Color color;
  final int type;
  /// type == 0 则使用保存在 Widget 中的颜色
  /// type != 0 则使用保存在 Widget 的 State 中的颜色
  const _MyStatefulWidget({Key? key, required this.color, required this.type}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {
  late Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: widget.type == 0 ? widget.color : myColor,
    );
  }
}