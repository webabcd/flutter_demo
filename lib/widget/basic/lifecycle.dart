/*
 * 生命周期
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class LifecycleDemo extends StatefulWidget {
  const LifecycleDemo({Key? key}) : super(key: key);

  /// 用于创建相关的 Element
  @override
  StatefulElement createElement() {
    log("createElement()");
    return super.createElement();
  }

  /// 用于创建这个 StatefulWidget 的 State（注：State 是保存在 Element 树中的）
  @override
  _LifecycleDemoState createState() => _LifecycleDemoState();
}

/// 通过 with WidgetsBindingObserver 可以监听应用程序的状态
class _LifecycleDemoState extends State<LifecycleDemo> with WidgetsBindingObserver {

  int counter = 0;

  /// 在生命周期中只在初始时调用一次，可以在这里做一些初始化工作
  @override
  void initState() {
    log("initState()");

    /// 开始监听
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  /// State 对应的 Element 被从树中永久移除时
  @override
  void dispose() {
    log("dispose()");

    /// 停止监听
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  /// 在 dispose() 之前调用，或者对应的 Element 被从树中临时移除时（这个一般用不到）
  @override
  void deactivate() {
    log("deactivate()");
    super.deactivate();
  }

  /// 在对应的 Element 被从树中临时移除后，又加入到树中时（这个一般用不到）
  @override
  void activate() {
    log("activate()");
    super.activate();
  }

  /// 用于 debug 模式下的开发调试
  /// 在 debug 模式下，每次 hot reload 后是不会重新创建 State 实例的，也不会走到 initState()
  /// 但是每次 hot reload 后会先调用这里，然后再执行 build()
  @override
  void reassemble() {
    log("reassemble()");
    super.reassemble();
  }

  /// 来自 with WidgetsBindingObserver 可以监听应用程序的状态，需要先 WidgetsBinding.instance.addObserver(this);
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    /// AppLifecycleState.resumed - 前台活动状态
    /// AppLifecycleState.paused - 后台非活动状态
    /// AppLifecycleState.inactive - 前台非活动状态（比如接听了一个电话，或 ios 中显示了系统的下拉菜单，等等）
    log('state: $state');
  }


  /// 构造 widget
  /// 在 initState() 或 setState() 或 didUpdateWidget() 或 didChangeDependencies() 或 activate() 之后调用
  @override
  Widget build(BuildContext context) {
    log("build()");
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () async {
              await Future.delayed(const Duration(milliseconds: 3000));

              /// mounted 用于表示 State 对应的 Element 是否挂载到树中
              ///   mounted 为 true 时，可以正常的 setState() 并渲染页面
              ///   mounted 为 false 时，如果调用 setState() 则会报错
              /// 如果异步任务回调后需要重新渲染页面，则建议先判断 mounted 以便确定是否可渲染
              /// 如果回调之前退出了页面的话，则 mounted 就变为 false 了，之后如果再去渲染页面的话就会报错
              if (mounted) {
                setState(() {

                });
              }
            },
            child: const Text('长时任务'),
          ),

          MyButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Text('计数器 +1'),
          ),
          MyText("counter:$counter"),
          _MyWidget1(counter: counter),
          _MyInheritedWidget(
            counter: counter,
            child: const _MyWidget2(),
          ),
        ],
      ),
    );
  }
}



class _MyWidget1 extends StatefulWidget {
  const _MyWidget1({required this.counter, Key? key}) : super(key: key);

  final int counter;

  @override
  _MyWidget1State createState() => _MyWidget1State();
}
class _MyWidget1State extends State<_MyWidget1> {

  /// 当父组件重绘时
  @override
  void didUpdateWidget(covariant _MyWidget1 oldWidget) {
    log("didUpdateWidget(), oldWidget:${oldWidget.counter}, newWidget:${widget.counter}");

    /// 因为父组件重新 build 了，所以 _MyWidget1 也会重新 build
    /// 一般在这里通过判断 _MyWidget1 新旧实例的与 UI 相关的参数是否发生变化，然后决定是否需要调用 setState() 从而更新 _MyWidget1 的状态
    /// setState(() { });

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MyText("counter:${widget.counter}");
  }
}



class _MyWidget2 extends StatefulWidget {
  const _MyWidget2({Key? key}) : super(key: key);

  @override
  _MyWidget2State createState() => _MyWidget2State();
}
class _MyWidget2State extends State<_MyWidget2> {

  /// 当 initState() 调用后，或者当依赖的 InheritedWidget 的共享变量发生变化时
  @override
  void didChangeDependencies() {
    log("didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MyText("counter:${_MyInheritedWidget.of(context)!.counter}");
  }
}



class _MyInheritedWidget extends InheritedWidget {
  const _MyInheritedWidget({Key? key, required Widget child, required this.counter}) : super(key:key, child: child);

  final int counter;

  static _MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant _MyInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }
}