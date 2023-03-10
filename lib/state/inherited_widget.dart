/*
 * 状态管理 - InheritedWidget（可用于多 Widget 之间的状态管理）
 *
 * 在父 Widget 中通过 InheritedWidget 共享一个数据，然后在其任意子 Widget 中都能获取此共享数据
 *
 * 注：比如 Scaffold.of(context), Theme.of(context), Navigator.of(context) 之类的都是通过 InheritedWidget 实现的
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({Key? key}) : super(key: key);

  @override
  _InheritedWidgetDemoState createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: MyInheritedWidget(      /// 父 Widget 使用自定义 InheritedWidget
        count: _count,              /// 需要在子树中共享的自定义数据
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              MyWidget1(),          /// 所有子节点均可以使用自定义 InheritedWidget 中的自定义数据
              Center(
                child: MyWidget2(), /// 所有子节点均可以使用自定义 InheritedWidget 中的自定义数据
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _count += 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


class MyWidget1 extends StatelessWidget {
  const MyWidget1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: MyText(
        /// 通过 .of() 使用自定义 InheritedWidget 实例
        MyInheritedWidget.of(context)!.count.toString(),
      ),
    );
  }
}

class MyWidget2 extends StatefulWidget {
  const MyWidget2({Key? key}) : super(key: key);
  @override
  _MyWidget2State createState() => _MyWidget2State();
}
class _MyWidget2State extends State<MyWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: MyText(
        /// 通过 .of() 使用自定义 InheritedWidget 实例
        MyInheritedWidget.of(context)!.count.toString(),
      ),
    );
  }
}


/// 自定义 InheritedWidget
/// 用于在父 Widget 中通过 InheritedWidget 共享一个数据，然后在其任意子 Widget 中都能获取此共享数据
class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget({Key? key, required Widget child, required this.count}) : super(key:key, child: child);

  /// 需要和子树共享的数据
  final int count;

  /// 这个 of() 是一个约定，子树可以通过 MyInheritedWidget.of(context) 的方式获取实例
  /// 原生的 Scaffold.of(context), Theme.of(context), Navigator.of(context) 之类的都是这么实现的
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  /// 是否需要通知子树中所有使用了 .of() 的 Widget 重新 build
  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return count != oldWidget.count;
  }
}