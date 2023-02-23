/*
 * dart 单线程异步编程（async/await/Future<T>/Stream<T>/Completer）
 *
 * 注：
 * 本例介绍的异步编程，只是在相同线程上的异步，并不是多线程，关于多线程请参见 isolate.dart
 */

import 'dart:async';

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
    // 演示 Completer 的用法
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
    try {
      // 对你自己的没有 async/await 的逻辑做异步编程
      var a = await myCompleter();                // Completer 通过 complete() 返回时，可在此处拿到返回值
      log("sample3: $a");                         // sample3: 888888
    } catch (e) {                                 // Completer 通过 completeError() 返回时，可在此处拿到异常值
      log("sample3 error: " + e.toString());      // sample3 error: -999
    }
  }

  // 当你自己的逻辑没有 async/await 时，但是你又想要异步编程，就可以使用 Completer 了
  Future<int> myCompleter() {
    // 实例化一个 Completer<T>，此处的 T 就是 Completer 的 future 属性返回的 Future<T> 中的 T
    Completer<int> c = Completer<int>();
    for (int i=0; i<10000000; i++) {
      if (i == 888888) {
        // 完成并返回指定类型的结果值（调用者通过 await 可以拿到此值）
        //c.complete(i);

        // 完成并返回指定类型的异常值（调用者通过 catch 可以拿到此值）
         c.completeError(-999);
        break;
      }
    }

    // 返回一个 Future<T> 对象，从而实现异步编程
    return c.future;
  }
}