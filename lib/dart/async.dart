/*
 * dart 异步编程（async/await/Future<T>/Stream<T>）
 *
 * dart 的异步编程是通过 isolate 实现的，忘记传统的多线程编程吧（当然 isolate 的底层技术还是通过系统的线程和进程实现的）
 * dart 有一个主 isolate，你可以新开 isolate 实现并发编程
 * dart 的 isolate 与传统线程的主要区别就是，每个 isolate 都只维护自己的内存堆且不会与其它 isolate 共享，也就是说不需要锁这种东西了
 * dart 的不同 isolate 之间通过消息传递来实现通信
 */

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartAsync extends StatelessWidget {
  const DartAsync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 通过 async/await Future<T> 实现异步编程
    sample1();
    // 演示 Stream<T> 的用法
    sample2();
    // 演示 isolate 的用法
    sample3();

    return const MyWidget(text: "dart_async");
  }

  // 如需在函数体内使用 await 则需要在函数体之前加上 async
  // 标记为 async 的函数会自动异步执行
  // async 函数有返回值则返回的是 Future<T>；没有返回值则返回的是 Future<void> 可以简写为 void
  void sample1() async {

    // await 就是让它异步执行，然后等着它执行完
    log("sample1: 1, ${currentTimestamp()}");
    var a = await f1();
    log("sample1: 2, ${currentTimestamp()}");
    var b = await f2();

    // 异步编程的异常处理
    try {
      log("sample1: 3, ${currentTimestamp()}");
      var c = await f3();
    } catch (e) {
      log("$e");
    } finally {
      log("sample1: 4, ${currentTimestamp()}");
    }

    log("sample1: 5, ${currentTimestamp()}");
    // 对于 async 函数来说，你也可以不 await 它，也就是说它会异步执行，但是你不用等它
    f4();
    log("sample1: 6, ${currentTimestamp()}");

    log("$a, $b");
  }

  // Future<T> 的意思是函数需要异步执行，其可被 await
  // T 是函数的真实返回值
  Future<String> f1() async {
    // 等待 2 秒
    await Future.delayed(const Duration(seconds: 2));
    // 返回数据，假设返回值类型为 T 则在函数体之前加上 async 的话，会自动返回 Future<T> 类型的数据
    return "sample1: aaa";

    // 也可以使用 Future.then() 返回 Future<T> 类型的数据，下面这句等同于上面两句
    // return Future.delayed(const Duration(seconds: 2)).then((value) => "sample1: aaa");
  }

  Future<String> f2() {
    // 这个返回值本身就是 Future<T> 类型，所以可以不在函数体之前加 async
    return Future.delayed(const Duration(seconds: 2), () => 'sample1: bbb');
  }

  Future<String> f3() {
    // 抛出一个数据，用于演示异步编程的异常处理
    return Future.delayed(const Duration(seconds: 2), () => throw 'sample1: ccc');
  }

  // 这个返回值类型实际上是 Future<void>
  void f4() async {
    await Future.delayed(const Duration(seconds: 2));
    log("sample1: ddd");
    log("sample1: 7, ${currentTimestamp()}");
  }



  void sample2() async {
    // 获取一个 Stream<T> 每迭代一次它会依次返回 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    var stream = myStream(10);
    log("sample2: ||||||||||");
    // 累加 Stream<T> 中迭代出的数据
    var sum = await myFuture(stream);
    log("sample2: $sum"); // sample2: 55
  }

  Future<int> myFuture(Stream<int> stream) async {
    var sum = 0;
    // 迭代 Stream<T>
    await for (final value in stream) {
      sum += value;
    }
    return sum;
  }

  // Stream<T> 是一个异步事件的序列，当你获取到 Stream<T> 的时候，它是不会执行的
  // 当你对它迭代的时候，如果有可迭代数据则每迭代一次就执行一次事件
  // 下面这个其实就是一个生成异步可迭代对象的生成器，关于生成器请参见 other.dart 中的关于生成器的说明
  Stream<int> myStream(int to) async* {
    for (int i = 1; i <= to; i++) {
      await Future.delayed(const Duration(seconds: 1));
      log("sample2: ----------");
      yield i;
    }
  }



  void sample3() async {
    // isolate2
    Future<void> isolate2(SendPort sp) async {
      for (var i = 0; i < 5; i++) {
        await Future.delayed(const Duration(seconds: 1));
        log("sample3: send $i");
        // 向消息通道发送消息（因为 isolate 之间不会共享内存，所以这里的消息会先复制然后再发送副本，所以可能会比较慢）
        sp.send(i);
      }
      log("sample3: send 999 and exit");
      // 终止当前 isolate 并关闭指定的消息通道，并且在关闭消息通道之前发送指定的消息（这个最后的消息不会复制，而是直接发送，所以会很快）
      Isolate.exit(sp, 999);
    }

    // isolate1
    Future<int> isolate1() async {
      // 创建一个用于在不同 isolate 之间传递消息的通道
      // ReceivePort 继承自 Stream<dynamic> 你可以通过它获取其他 isolate 发来的消息
      var rp = ReceivePort();
      // 通过 spawn() 启动指定的 isolate 并传递指定消息通道的 SendPort 对象，以便新启动的 isolate 可以发送消息
      await Isolate.spawn(isolate2, rp.sendPort);

      var sum = 0;
      // 接收消息通道中发来的消息
      await for (final value in rp) {
        var v = value as int;
        log("sample3: recv $v");
        // 自定义约定，收到 999 就退出
        if (v == 999) {
          break;
        }
        sum += v;
      }
      return sum;
    }

    var a = await isolate1();
    log("sample3: $a"); // sample3: 10
  }
}