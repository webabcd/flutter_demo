/*
 * 状态管理 - ValueNotifier（可用于多 Widget 之间的状态管理）
 * ValueNotifier<T> 继承自 ChangeNotifier，ChangeNotifier 继承自 Listenable（可监听对象）
 * ValueNotifier<T> 实现了 ValueListenable<T> 接口
 *
 * ValueNotifier 用于将指定的数据类型以及对它的管理封装到一起并自动提供数据变化的通知
 * 可以通过 ValueListenableBuilder 结合 ValueNotifier 实现数据的管理以及 UI 的更新
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ValueNotifierDemo extends StatefulWidget {
  const ValueNotifierDemo({Key? key}) : super(key: key);

  @override
  _ValueNotifierDemoState createState() => _ValueNotifierDemoState();
}

class _ValueNotifierDemoState extends State<ValueNotifierDemo> {

  final _MyValueNotifier _myValueNotifier = _MyValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    /// ValueListenableBuilder 的作用如下：
    ///   自动关联 valueListenable 指定的 ValueListenable<T> 对象并自动监听他的变化，当发生变化时会自动将更新后的值传递给 builder 并重绘
    return ValueListenableBuilder(
      valueListenable: _myValueNotifier,
      builder: (context, value, child) {  /// 此处的 value 就是 _myValueNotifier 管理的值发生变化后传递过来的新值
        return Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => _myValueNotifier.increment(),
                child: const Icon(Icons.exposure_plus_1_outlined),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => _myValueNotifier.decrement(),
                child: const Icon(Icons.exposure_minus_1_outlined),
              ),
            ],
          ),
          body: Container(
            color: Colors.orange,
            child: Center(
              child: MyText(value.toString()),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    /// 清理 ValueNotifier
    _myValueNotifier.dispose();
    super.dispose();
  }
}

/// 自定义 ValueNotifier 用于管理 int 类型的数据并自动提供数据变化的通知
class _MyValueNotifier extends ValueNotifier<int> {
  _MyValueNotifier(int value) : super(value);

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}