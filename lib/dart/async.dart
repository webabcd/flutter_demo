/*
 * dart 单线程异步编程（async/await/Future<T>/Stream<T>/StreamSubscription/Completer/Timer）
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

    // 通过 async/await Future<T> 实现异步编程，等待与不等待，异常处理，超时处理
    sample1();
    // 演示 Stream<T> 的用法
    sample2();
    // 演示 StreamSubscription 的用法，以及如何取消 Future
    sample3();
    // 演示 Completer 的用法
    sample4();
    // 演示 Timer 的用法
    sample5();

    return const MyWidget(text: "dart_async");
  }

  // 如需在函数体内使用 await 则需要在函数体之前加上 async
  // 标记为 async 的函数会自动异步执行
  // async 函数有返回值则返回的类型是 Future<T>（可以省略 async）
  // async 函数没有返回值则返回的类型是 Future<void>（可以省略 async），也可以简写为 void（不可以省略 async）
  void sample1() async {

    // await 就是让它异步执行，然后等着它执行完
    log("sample1: 1, ${currentTimestamp()}");
    var a = await f1();
    log(a);
    log("sample1: 2, ${currentTimestamp()}");
    var b = await f2();
    log(b);


    // 异步编程的异常处理
    try {
      log("sample1: 3, ${currentTimestamp()}");
      var c = await f3();
    } catch (e) {
      log("$e");
    } finally {
      log("sample1: 4, ${currentTimestamp()}");
    }


    // then() 的用法
    log("sample1: 5, ${currentTimestamp()}");
    // 对于 async 函数来说，你也可以不 await 它，也就是说它会异步执行，但是你不用等它
    // then() - 当 Future 完成时会回调此方法（你不等他了怎么知道他完成了呢，就可以用这个）
    f4().then((value) => {
      log(value)
    });
    log("sample1: 6, ${currentTimestamp()}");


    // 使用 then() 时的异常处理（onError, catchError, whenComplete）
    f5().then((value) => log(value), onError:(e) {
      // 用于捕获 future() 过程中的异常
      log("onError: $e");
    }).catchError((e) {
      // 用于捕获 then() 过程中的异常
      // 如果没有在 then() 中定义 onError() 则这里也会捕获 future() 过程中的异常
      log("catchError: $e");
    }).whenComplete(() => {
      // 当 Future 完成后，无论是否发生异常都会走到这里，类似 finally
      log("whenComplete")
    });


    // 通过 Future 的 timeout() 实现异步的超时处理
    try {
      await f6().timeout(const Duration(seconds: 1));
    } catch (e) {
      // 超时后会捕获到 TimeoutException 类型的异常
      log("timeout: $e");
    }
    // 不用 try/catch 的话可以通过 onTimeout 处理超时后的回调
    var result = await f6().timeout(const Duration(seconds: 1), onTimeout: () {
      // 返回值的类型与你的 Future<T> 中 T 一样
      return "timeout";
    });
    log(result);
  }

  // Future<T> 的意思是函数需要异步执行，其可被 await
  // T 是函数的真实返回值
  Future<String> f1() async {
    // 等待 2 秒
    await Future.delayed(const Duration(seconds: 2));
    // 返回数据，假设返回值类型为 T 则在函数体之前加上 async 的话，会自动返回 Future<T> 类型的数据
    // 也就是说下面这句等同于 return Future.value("sample1: aaa");
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

  Future<String> f4() {
    return Future.delayed(const Duration(seconds: 2), () => 'sample1: ddd');
  }

  Future<String> f5() {
    return Future.delayed(const Duration(seconds: 2), () => throw 'sample1: eee');
  }

  Future<String> f6() {
    return Future.delayed(const Duration(seconds: 2), () => 'sample1: fff');
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
      log("sample2: ---------- $i");
      yield i;
    }
  }



  void sample3() async {
    var stream = myStream2(10);
    // 通过 Stream 的 listen() 方法创建一个 StreamSubscription 对象用来管理 Stream
    // cancelOnError 如果是 false 则 Stream 异常后会走到 onDone
    // cancelOnError 如果是 true 则 Stream 异常后不会走到 onDone
    StreamSubscription<int> streamSubscription = stream.listen(null, cancelOnError: false);

    // 通过 StreamSubscription 可以控制对应的 Stream 的暂停和继续
    // streamSubscription.pause();
    // var isPaused = streamSubscription.isPaused;
    // streamSubscription.resume();

    // 取消 Stream（Stream 会被取消，且不会走到 onDone）
    // streamSubscription.cancel();

    // 收到 Stream 的数据时
    streamSubscription.onData((data) {
      log("sample3 onData: $data");
    });
    // Stream 发生异常时
    streamSubscription.onError((e) {
      log("sample3 onError: $e");
    });
    // Stream 的数据都收到时
    // 或者 Stream 发生异常了且 cancelOnError 为 false 时
    streamSubscription.onDone(() {
      log("sample3 onDone");
    });

    // Future 和 Stream 之间可以互相转换
    // 将 Stream 转换为 Future 后，要注意 onDone 和 onError 都不会被调用了，分别要用 Future 的 then() 和 catchError() 取代之
    // var myFuture = streamSubscription.asFuture();
    // 如果需要取消 Future 的话，你可以将其转换为 Stream，然后通过 StreamSubscription 取消
    // var myStream = myFuture.asStream();
  }

  Stream<int> myStream2(int to) async* {
    for (int i = 1; i <= to; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (i > 3) {
        throw Exception("error");
      }
      yield i;
    }
  }



  void sample4() async {
    try {
      // 对你自己的没有 async/await 的逻辑做异步编程
      var a = await myCompleter();                // Completer 通过 complete() 返回时，可在此处拿到返回值
      log("sample4: $a");                         // sample4: 888888
    } catch (e) {                                 // Completer 通过 completeError() 返回时，可在此处拿到异常值
      log("sample4 error: " + e.toString());      // sample4 error: -999
    }
  }

  // 当你自己的逻辑没有 async/await 时，但是你又想要异步编程，就可以使用 Completer 了
  Future<int> myCompleter() {
    // 实例化一个 Completer<T>，此处的 T 就是 Completer 的 future 属性返回的 Future<T> 中的 T
    Completer<int> c = Completer<int>();
    for (int i=0; i<10000000; i++) {
      if (i == 888888) {
        // 完成并返回指定类型的结果值（调用者通过 await 可以拿到此值）
        c.complete(i);

        // 完成并返回指定类型的异常值（调用者通过 catch 可以拿到此值）
        // c.completeError(-999);
        break;
      }
    }

    // 返回一个 Future<T> 对象，从而实现异步编程
    return c.future;
  }



  void sample5() {
    var timeout = const Duration(seconds: 3);
    log('currentTimestamp1:${currentTimestamp()}');
    // 指定的时间之后回调
    Timer(timeout, () {
      log('currentTimestamp1:${currentTimestamp()}');
    });

    var period = const Duration(seconds: 1);
    log('currentTimestamp2:${currentTimestamp()}');
    // 指定的间隔时间回调
    Timer.periodic(period, (timer) {
      log('currentTimestamp2:${currentTimestamp()}, ${timer.tick}');
      if (timer.tick >= 5) {  // 定时器的执行次数
        timer.cancel();       // 停止定时器
      }
    });
  }
}