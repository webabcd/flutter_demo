/*
 * StreamBuilder - 跟踪 Stream 的变化并构造 Widget
 */

import 'dart:async';

import 'package:flutter/material.dart';

import '../../helper.dart';

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({Key? key}) : super(key: key);

  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {

  /// 定义一个 Stream
  final Stream<String> _myStream = (() {
    late final StreamController<String> controller;
    controller = StreamController<String>(
      onListen: () async {
        await Future<void>.delayed(const Duration(seconds: 2));
        controller.add("aaa");
        await Future<void>.delayed(const Duration(seconds: 2));
        controller.add("bbb");
        await Future<void>.delayed(const Duration(seconds: 2));
        controller.add("ccc");
        await controller.close();
      },
    );
    return controller.stream;
  })();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        /// StreamBuilder<T> 中的 T 就是需要跟踪的 Stream<T> 中的 T
        child: StreamBuilder<String>(
          /// 指定需要跟踪的 Stream
          stream: _myStream,
          /// 根据 Stream 的不同阶段构造不同的 Widget（当 ConnectionState 发生变化时就会执行到此处）
          /// AsyncSnapshot - 当前的异步处理快照
          ///   connectionState - Stream 的状态
          ///     none - Stream 为 null 时
          ///     waiting - Stream 处理中
          ///     done - Stream 完成了
          ///     active - Stream 每一次迭代时
          ///   hasData - 存在正常的返回结果
          ///   hasError - 存在异常信息
          ///   data - 获取 Stream 的返回结果
          ///   error - 获取 Stream 的异常信息
          /// 注：关于 hasData, hasError, data, error 有一个要注意的地方
          /// 当多次做异步处理时，如果新的异步处理正在 waiting 状态，那么 hasData, hasError, data, error 保存的是上一次异步处理的结果
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children = [];
            log("${snapshot.connectionState}");
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
            } else if (snapshot.connectionState == ConnectionState.active) {
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
      )
    );
  }
}