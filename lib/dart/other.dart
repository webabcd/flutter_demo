/*
 * dart 其它（用调用函数的方式调用类的实例，生成器）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartOther extends StatelessWidget {
  const DartOther({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 用调用函数的方式调用类的实例
    sample1();
    // 生成器（生成可迭代对象，迭代到谁才会真正的执行谁）
    sample2();

    return const MyWidget(text: "dart_other");
  }

  void sample1() {
    // 实例化
    var a = _MyClass();
    // 用调用函数的方式调用类的实例（实际上调用的是对象的 call() 方法）
    var b = a("webabcd");

    log(b); // hello: webabcd
  }

  void sample2() {

    // 生成一个同步可迭代对象，迭代到谁才会真正的执行谁
    // 标记为 sync* 的函数返回 Iterable<T> 类型的对象
    Iterable<int> syncGenerator(int n) sync* {
      int k = 0;
      while (k < n) {
        yield k++;
      }
    }
    for (var item in syncGenerator(3)) {
      log("$item");
    }

    // 生成一个异步可迭代对象（用法请参见 async.dart 中的关于 Stream<T> 的用法），迭代到谁才会真正的执行谁
    // 标记为 async* 的函数返回 Stream<T> 类型的对象
    Stream<int> asyncGenerator(int n) async* {
      int k = 0;
      while (k < n) {
        yield k++;
      }
    }
  }
}

class _MyClass {
  // 实现 call() 方法后，就可以实现用调用函数的方式调用类的实例
  String call(String name) => 'hello: $name';
}