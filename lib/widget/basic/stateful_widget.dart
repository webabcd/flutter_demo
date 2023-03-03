/*
 * StatefulWidget - 有状态 widget
 *
 * 无状态 widget 的意思是：内容确定之后，自己无法修改自己的内容
 * 有状态 widget 的意思是：内容确定之后，自己可以修改自己的内容
 *
 * 要让有状态 widget 自己修改自己，仅需如下两个步骤
 * 1、把 build() 放到 State<T> 中实现
 * 2、在 State<T> 中通过 setState() 修改状态，然后对应的 Widget 会重新创建，从而重绘 UI
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class StatefulWidgetDemo extends StatefulWidget {
  const StatefulWidgetDemo({Key? key}) : super(key: key);

  /// 用于演示如何在 State<T> 中调用 StatefulWidget 中的属性或方法
  final param = "webabcd";

  /// 把 build() 放到 State<T> 中实现
  @override
  _StatefulWidgetDemoState createState() => _StatefulWidgetDemoState();
}

class _StatefulWidgetDemoState extends State<StatefulWidgetDemo> {
  int _counter1 = 0;
  int _counter2 = 0;

  void _handleTap() {
    /// 在 State<T> 中通过 setState() 修改自己，
    /// setState() 的意思就是，执行完指定的逻辑后调用 build() 重新渲染
    /// 本例用于演示，如何响应自己的行为然后修改自己
    setState(() {
      _counter1++;
    });
  }

  void _handleMyWidgetChanged(int newValue) {
    /// 在 State<T> 中通过 setState() 修改自己，
    /// setState() 的意思就是，执行完指定的逻辑后调用 build() 重新渲染
    /// 本例用于演示，如何响应自己的儿子的行为然后修改自己的儿子（自己的儿子是无状态 widget，它无法自己修改自己）
    setState(() {
      _counter2 = newValue;
    });
  }

  /// 用于初始化数据
  @override
  void initState() {
    super.initState();

    /// 通过如下方式调用 StatefulWidget 中的属性或方法
    log(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _handleTap,
            child: Container(
              width: 200,
              margin: const EdgeInsets.all(5),
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "$_counter1",
                style: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          _MyWidget(
            counter: _counter2,
            onChanged: _handleMyWidgetChanged, /// 用于儿子回调
          ),
        ],
      ),
    );
  }
}

class _MyWidget extends StatelessWidget {
  const _MyWidget({
    Key? key,
    this.counter = 0,
    required this.onChanged,
  }) : super(key: key);

  final int counter;
  final ValueChanged<int> onChanged; /// 用于通知父亲

  void _handleTap() {
    onChanged(counter + 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "$counter",
          style: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}