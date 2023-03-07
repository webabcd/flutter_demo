/*
 * FutureBuilder - 跟踪 Future 的变化并构造 Widget
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class FutureBuilderDemo extends StatefulWidget {
  const FutureBuilderDemo({Key? key}) : super(key: key);

  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {

  Future<String>? _myFuture;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        children: [
          Flexible(
            /// FutureBuilder<T> 中的 T 就是需要跟踪的 Future<T> 中的 T
            child: FutureBuilder<String>(
              /// 指定需要跟踪的 Future
              future: _myFuture,
              /// 根据 Future 的不同阶段构造不同的 Widget（当 ConnectionState 发生变化时就会执行到此处）
              /// AsyncSnapshot - 当前的异步处理快照
              ///   connectionState - Future 的状态
              ///     none - Future 为 null 时
              ///     waiting - Future 处理中
              ///     done - Future 完成了
              ///     active - Stream 每一次迭代时（参见 stream_builder.dart）
              ///   hasData - 存在正常的返回结果
              ///   hasError - 存在异常信息
              ///   data - 获取 Future 的返回结果
              ///   error - 获取 Future 的异常信息
              /// 注：关于 hasData, hasError, data, error 有一个要注意的地方
              /// 当多次做异步处理时，如果新的异步处理正在 waiting 状态，那么 hasData, hasError, data, error 保存的是上一次异步处理的结果
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children = [];
                children.add(
                  MyText("${snapshot.connectionState}")
                );

                if (snapshot.connectionState == ConnectionState.none) {

                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    children.addAll([
                      const Icon(Icons.check_circle_outline, color: Colors.green, size: 60,),
                      MyText("result: ${snapshot.data}"),
                    ]);
                  } else if (snapshot.hasError) {
                    children.addAll([
                      const Icon(Icons.error_outline, color: Colors.red, size: 60,),
                      MyText("result: ${snapshot.error}"),
                    ]);
                  }
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  children.addAll([
                    const SizedBox(width: 60, height: 60, child: CircularProgressIndicator()),
                    MyText("异步处理中"),
                  ]);
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
          ),
          Container(
            height: 40,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('异步处理并返回结果'),
                  onPressed: () {
                    setState(() {
                      _myFuture = Future<String>.delayed(
                        const Duration(seconds: 2), () => 'future ok',
                      );
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('异步处理并返回异常'),
                  onPressed: () {
                    setState(() {
                      _myFuture = Future<String>.delayed(
                        const Duration(seconds: 2), () => throw 'future error',
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}