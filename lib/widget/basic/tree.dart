/*
 * Flutter 中的三棵树
 * 1、Widget 树
 *   Widget 是一个用来描述 UI 的配置
 * 2、RenderObject 树
 *   RenderObject 是用于渲染的对象，比如要获取组件宽高的话就需要从 RenderObject 中获取
 * 3、Element 树
 *   Element 是 Widget 实例化出的对象，它是 Widget 和 RenderObject 之间的桥梁
 *   Element 会持有其对应的 Widget
 *   如果 Element 是需要渲染的，则会通过 Widget 生成 RenderObject 对象
 *
 *
 * 首次新建某个 Widget 对象时，会自动新建一个持有此 Widget 的 Element 对象
 * 当这个 View 需要更新时，需要重新生成这个 Widget 对象，这个新生成的 Widget 对象会替代之前的 Widget 对象与 Element 建立关系
 * 这就是所谓的 Element 与 Widget 的一对多关系，但是同一时刻 Element 与 Widget 其实是一对一的关系
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class TreeDemo extends StatefulWidget {
  const TreeDemo({Key? key}) : super(key: key);

  @override
  _TreeDemoState createState() => _TreeDemoState();
}

class _TreeDemoState extends State<TreeDemo> {
  /// 颜色信息保存在 Widget 中
  List<Widget> widgets1 = [
    _MyStatefulWidget(color: Colors.red, type: 0),
    _MyStatefulWidget(color: Colors.green, type: 0),
  ];

  /// 颜色信息保存在 Widget 的 State 中
  List<Widget> widgets2 = [
    _MyStatefulWidget(color: Colors.red, type: 1, key: ValueKey("1")),
    _MyStatefulWidget(color: Colors.green, type: 1, key: ValueKey("2"),),
  ];

  /// 颜色信息保存在 Widget 的 State 中
  List<Widget> widgets3 = [
    _MyStatefulWidget(color: Colors.red, type: 1),
    _MyStatefulWidget(color: Colors.green, type: 1),
  ];

  /// 颜色信息保存在 Widget 的 State 中
  List<Widget> widgets4 = [
    _MyStatefulWidget(color: Colors.red, type: 1),
    _MyStatefulWidget(color: Colors.green, type: 1),
    _MyStatefulWidget(color: Colors.blue, type: 1),
  ];

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
            /// 交换两个 Widget 的位置，颜色信息保存在 Widget 中
            /// 在 Widget 树中，两个 Widget 的位置对调了
            /// 此时 Element 树没有变化，每个 Element 通过 Widget 树中 Widget 的索引位置持有其对应的 Widget
            /// 也就是说，第 1 个 Element 持有的是 Widget 树上的第 1 个 Widget，第 2 个 Element 持有的是 Widget 树上的第 2 个 Widget
            /// 因为两个 Widget 对调了，所以第 1 个 Element 持有了原来第 2 个 Widget，第 2 个 Element 持有了原来第 1 个 Widget
            /// Element 会调用持有的 Widget 的 canUpdate() 方法，其会判断新老 Widget 的 key 和 runtimeType 是否相同（注：如果没指定 Widget 的 key 则认为 key 是相同的）
            /// 然后发现 key 和 runtimeType 均相同，所以第 1 个 Element 就认为其持有原来的第 2 个 Widget 是合法的，同理第 2 个 Element 就认为其持有原来的第 1 个 Widget 是合法的
            /// 因为使用的颜色信息是保存在 Widget 中的，所以随着 Widget 的对调，颜色也对调了
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
            /// 交换两个 Widget 的位置，颜色信息保存在 Widget 的 State 中（注：State 是保存在 Element 树中的）
            /// 在 Widget 树中，两个 Widget 的位置对调了
            /// 此时 Element 树没有变化，每个 Element 通过 Widget 树中 Widget 的索引位置持有其对应的 Widget
            /// 也就是说，第 1 个 Element 持有的是 Widget 树上的第 1 个 Widget，第 2 个 Element 持有的是 Widget 树上的第 2 个 Widget
            /// 因为两个 Widget 对调了，所以第 1 个 Element 持有了原来第 2 个 Widget，第 2 个 Element 持有了原来第 1 个 Widget
            /// Element 会调用持有的 Widget 的 canUpdate() 方法，其会判断新老 Widget 的 key 和 runtimeType 是否相同（注：如果没指定 Widget 的 key 则认为 key 是相同的）
            ///   1、如果你没有为 Widget 指定不同的 key，则 key 和 runtimeType 均相同，所以第 1 个 Element 就认为其持有原来的第 2 个 Widget 是合法的，同理第 2 个 Element 就认为其持有原来的第 1 个 Widget 是合法的
            ///   因为使用的颜色信息是保存在 Widget 的 State 中的（State 是保存在 Element 树中的），所以虽然 Widget 对调了，但是颜色不会对调
            ///   2、如果你为 Widget 指定了不同的 key，则因为 key 是不同的，所以第 1 个 Element 就认为其持有原来的第 2 个 Widget 是不合法的
            ///   然后第 1 个 Element 就会在 Widget 树上查找，看看有没有和之前的 Widget 的 key 和 runtimeType 都相同的
            ///   结果找到了，然后第 1 个 Element 就持有了原来的第 1 个 Widget，同理第 2 个 Element 就持有了原来的第 2 个 Widget
            ///   所以随着 Widget 的对调，颜色也对调了
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
            /// 把上面的都看懂了，再来理解这个
            /// 从位置 0 插入蓝色的 Widget，颜色信息保存在 Widget 的 State 中（注：State 是保存在 Element 树中的）
            /// 开始时，红色的 widget1，绿色的 widget2，element1 持有 widget1，element2 持有 widget2
            /// 第一次在 0 位置插入蓝色的 widget3 后
            ///   1、没有为 Widget 指定不同的 key 时
            ///   element1 持有 widget3，显示为红色（element1 持有的是 widget 树中的第 1 个 widget）
            ///   element2 持有 widget1，显示为绿色（element2 持有的是 widget 树中的第 2 个 widget）
            ///   widget2 没人要，所以会新建一个 element3 持有之，显示为绿色（element3 持有的是 widget 树中的第 3 个 widget）
            ///   显示结果：红绿变为红绿绿
            ///   2、为 Widget 指定不同的 key 时
            ///   element1 持有 widget1，显示为红色（element1 持有的是 widget 树中的第 2 个 widget）
            ///   element2 持有 widget2，显示为绿色（element2 持有的是 widget 树中的第 3 个 widget）
            ///   widget3 没人要，所以会新建一个 element3 持有之，显示为蓝色（element3 持有的是 widget 树中的第 1 个 widget）
            ///   显示结果：红绿变为蓝红绿
            widgets3.insert(0, _MyStatefulWidget(color: Colors.blue, type: 1));
            setState(() {});
          },
        ),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets4,
          ),
          onTap: () {
            /// 把上面的都看懂了，再来理解这个
            /// 从位置 0 删除 Widget，颜色信息保存在 Widget 的 State 中（注：State 是保存在 Element 树中的）
            /// 开始时，红色的 widget1，绿色的 widget2，蓝色的 widget3，element1 持有 widget1，element2 持有 widget2，element3 持有 widget3
            /// 第一次在 0 位置删除红色的 widget1 后
            ///   1、没有为 Widget 指定不同的 key 时
            ///   element1 持有 widget2，显示为红色（element1 持有的是 widget 树中的第 1 个 widget）
            ///   element2 持有 widget3，显示为绿色（element2 持有的是 widget 树中的第 2 个 widget）
            ///   element3 找不到对应的 Widget 所以 element3 会被销毁
            ///   显示结果：红绿蓝变为红绿
            ///   2、为 Widget 指定不同的 key 时
            ///   element2 持有 widget2，显示为绿色（element2 持有的是 widget 树中的第 1 个 widget）
            ///   element3 持有 widget3，显示为蓝色（element3 持有的是 widget 树中的第 2 个 widget）
            ///   element1 找不到对应的 Widget 所以 element1 会被销毁
            ///   显示结果：红绿蓝变为绿蓝
            widgets4.removeAt(0);
            setState(() {});
          },
        ),

        /// 把上面的示例都看懂后，再继续说明一下
        /// 1、数据保存在 State 中且没有指定 key 的时候，Widget 树变化后
        ///   Element 会在 Widget 的同级树上查找（不会在父级或子级查找），且先会先按照之前的索引位置查找
        /// 2、数据保存在 State 中且指定了不同的 LocalKey 的时候，Widget 树变化后
        ///   Element 会在 Widget 的同级树上查找（不会在父级或子级查找） LocalKey 相同的那个 Widget
        ///   如果你的 LocalKey 是 UniqueKey，则每次 Widget 树变化后，原 Element 都找不到 key 相同的 Widget，所以就会重新创建新的 Element，原 Element 会被销毁
        /// 3、数据保存在 State 中且指定了不同的 GlobalKey 的时候，Widget 树变化后
        ///   Element 会在 Widget 的全局树上查找 GlobalKey 相同的那个 Widget

        /// 通过 Builder 获取上下文，这个上下文是由框架传递过来的
        Builder(
          builder: (context) {
            return GestureDetector(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.orange,
              ),
              onTap: () {
                /// 通过 context 获取对应的 RenderObject
                /// 如果想获取某个指定的 Widget 对应的 RenderObject 的话，则可以使用 GlobalKey
                RenderBox box = context.findRenderObject() as RenderBox;

                /// 获取此 RenderObject 的相对于屏幕的位置
                /// 对于本例来说拿到的就是 Container 相对于屏幕的位置
                var globalOffset = box.localToGlobal(Offset.zero);
                log("相对于屏幕的位置:$globalOffset");

                /// 获取此 RenderObject 的宽高
                /// 对于本例来说拿到的就是 Container 的宽高
                var size = box.size;
                log("尺寸:${size.width},${size.height}");
              },
            );
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