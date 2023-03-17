/*
 * 状态管理 - ChangeNotifier（多 Widget 之间的多数据的状态管理）
 * ChangeNotifier 继承自 Listenable（可监听对象）
 *
 * flutter 的所谓的声明式 UI，可以将其理解为一个公式 UI = f(state)
 * 其中 f 是构建方法，state 是状态，如果要更新 UI 的话，实际上就是修改状态，然后通过你的构建方法重绘 UI
 *
 * 如果是简单的场景，比如只要 Widget 自己管理自己的状态，那么直接用 StatefulWidget 就好
 * 如果要在多个 Widget 之间管理状态的话，可以使用 provider（ChangeNotifier, ChangeNotifierProvider, Consumer）
 *
 * 添加 provider 库的方法，在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dependencies:
 *   provider: ^6.0.5
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';
import 'package:provider/provider.dart';

class ChangeNotifierDemo extends StatefulWidget {
  const ChangeNotifierDemo({Key? key}) : super(key: key);

  @override
  _ChangeNotifierDemoState createState() => _ChangeNotifierDemoState();
}

class _ChangeNotifierDemoState extends State<ChangeNotifierDemo> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(      /// 在需要使用 provider 做状态管理的 Widget 的上层使用 ChangeNotifierProvider
        create: (context) => _MyModel(),  ///   create - 用于创建提供变化通知的 ChangeNotifier 对象
        child: const _MyApp()
      ),
    );

    /// 如果需要监听多个对象的变化，则可以像下面这样使用 MultiProvider
    /*
    return Center(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _MyModel()),
          ChangeNotifierProvider(create: (context) => _MyModel2()),
        ],
        child: const _MyApp(),
      ),
    );
    */
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(
        /// 通过 Consumer<T> 使用指定的 ChangeNotifier 对象
        child: Consumer<_MyModel>(
          /// 指定的 ChangeNotifier 对象发生变化时就会走到这里
          builder: (context, myModel, child) => Text(
            myModel.toString(),
          ),
        ),
      ),
      persistentFooterButtons:[
        TextButton(
          child: const Text("添加一个"),
          onPressed: () {
            /// 获取相关的 ChangeNotifier 对象
            var myModel = context.read<_MyModel>();
            /// 调用此对象的方法后（且此方法内有 notifyListeners() 的调用）就会走到 Consumer<T>，然后重绘 Consumer<T> 内的 Widget
            myModel.add("${currentTimestamp()}");
            /// 如果你不想走到 Consumer<T> 重绘，可以通过如下的方式调用
            // Provider.of<_MyModel>(context, listen: false).add("${currentTimestamp()}");
          },
        ),
        TextButton(
          child: const Text("删除最后一个"),
          onPressed: () {
            /// 获取相关的 ChangeNotifier 对象
            var myModel = context.read<_MyModel>();
            myModel.removeLast();
          },
        )
      ],
    );
  }
}

/// 提供变化通知的 ChangeNotifier 对象
/// ChangeNotifier 继承自 Listenable（可监听对象）
class _MyModel extends ChangeNotifier {

  final List<String> _items = [];

  void add(String item) {
    _items.add(item);
    /// 触发变化通知
    notifyListeners();
  }

  void removeLast() {
    _items.removeLast();
    /// 触发变化通知
    notifyListeners();
  }

  @override
  String toString() {
    return _items.join("\n");
  }
}