/*
 * 状态管理 - Redux
 *
 * Redux 是单向数据流，更新数据后，所有监听者都可以收到更新事件并获取更新后的数据
 *
 * 流程：
 * 1、View 生成 Action（类型和数据）
 * 2、Store 将 Action 派发给 Reducer
 * 3、Reducer 根据 Action 的类型和数据做逻辑处理，处理结果保存在 State 中，然后把 State 保存到 Store 中
 * 4、所有监听了此 Store 的 View 都会收到更新事件，并可以获取到这个 Store
 * 总结一下就是 View -> Action -> Reducer -> Store -> View
 *
 *
 * 在 pubspec.yaml 中做如下配置，然后 flutter pub get
 * dependencies:
 *   redux: ^5.0.0
 *   flutter_redux: ^0.10.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../helper.dart';

class ReduxDemo extends StatefulWidget {
  const ReduxDemo({Key? key}) : super(key: key);

  @override
  _ReduxDemoState createState() => _ReduxDemoState();
}

class _ReduxDemoState extends State<ReduxDemo> {

  /// Store
  /// 实例化 Store 时需要指定其关联的 Reducer 以及初始的 State 数据
  final _store = Store<_InfoState>(infoReducer, initialState: _InfoState(messageList: []));

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// StoreProvider 用于为其所有的后代监听指定的 Store
    return StoreProvider(
      /// 需要监听的 Store
      store: _store,
      child: Scaffold(
        appBar: AppBar(title: const Text("title"),),
        backgroundColor: Colors.orange,
        body: Center(
          /// 监听的 Store 更新时
          /// 以本例来说，_InfoState 是 Store 中保存的 State 的类型，List<Widget>? 是 converter 处理后的数据类型
          child: StoreConnector<_InfoState, List<Widget>?>(
            /// 通过 converter 处理数据，并返回指定类型的结果
            converter: (store) {
              return [for (var i = 0; i < store.state.messageList.length; i++) MyText(store.state.messageList[i])];
            },
            /// 根据 converter 后的结果，渲染指定的 Widget
            /// 以本例来说，items 是 converter 处理后的 List<Widget>? 类型的数据
            builder: (context, items) {
              return ListView.builder(
                itemBuilder: (context, index) => items![index],
                itemCount: items?.length,
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: 0,
              child: const Icon(Icons.remove),
              onPressed: () {
                /// 将 Action 派发给 Reducer
                _store.dispatch(RemoveMessageAction());
              },
            ),
            FloatingActionButton(
              heroTag: 1,
              child: const Icon(Icons.add),
              onPressed: () async{
                var result = await showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: TextField(controller: _controller,),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, _controller.text),
                        child: const Text('确认'),
                      ),
                    ],
                  ),
                );
                if (result?.isNotEmpty ?? false) {
                  /// 将 Action 派发给 Reducer
                  _store.dispatch(AddMessageAction(_controller.text));
                  _controller.text = "";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// State
class _InfoState {
  List<String> messageList;
  _InfoState({required this.messageList});
}

/// Action
class AddMessageAction {
  final String message;
  AddMessageAction(this.message);
}
class RemoveMessageAction {}

/// Reducer
_InfoState infoReducer(_InfoState state, dynamic action) {
  if (action.runtimeType == AddMessageAction) {           /// 判断 Action 的类型
    var message = (action as AddMessageAction).message;   /// 获取 Action 的数据
    state.messageList.add(message);
    return state;
  }
  if (action.runtimeType == RemoveMessageAction) {
    if (state.messageList.isNotEmpty) {
      state.messageList.removeAt(0);
    }
    return state;
  }
  return state;
}