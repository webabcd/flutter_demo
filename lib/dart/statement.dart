/*
 * dart 控制语句（if/else, switch/case, while/do-while, for）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartStatement extends StatelessWidget {
  const DartStatement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // if/else
    sample1();
    // switch/case
    sample2();
    // while/do-while
    sample3();
    // for/forEach
    sample4();

    return const MyWidget(text: "dart_statement");
  }

  void sample1() {
    var a = 1;
    if (a > 1) {
      log("a > 1");
    } else if (a < 1) {
      log("a < 1");
    } else {
      log("a == 1");
    }

    Object b = "webabcd";
    // 判断类型成功之后，再使用时其就是被转换之后的
    if (b is String) {
      log("${b.length}");
    }
    // 判断类型成功之后，再使用时其就是被转换之后的
    if (b is String && b.length == 7) {
      log("ok");
    }

    String? c = currentTimestamp() % 999999 == 0 ? null : "webabcd";
    // 判断为非空之后，再使用时其就是非空了
    if (c != null) {
      log("${c.length}");
    }
    // 判断为非空之后，再使用时其就是非空了
    if (c != null && c.length == 7) {
      log("ok");
    }
  }

  void sample2() {
    var a = 1;
    switch (a) {
      case 1:
        log("a == 1");
        break; // 没有 break 的话会编译时报错
      default:
        log("a != 1");
    }

    var b = 0;
    switch (b) {
      case 0: // 空 case 语句允许没有 break，结果就是强制执行下一个 case 语句中的表达式（不管下一个 case 语句的条件是否匹配），这种行为称之为 fall-through
      case 1:
        log("b == 1");
        break;
      default:
        log("b != 1");
    }
    // 上面的执行结果为：
    // b == 1

    var c = 0;
    switch (c) {
      case 0:
        log("c == 0");
        continue myLabel; // 如果需要自行控制 fall-through 则可以通过 continue 跳转到指定的位置
      case 1:
        log("c == 1");
        break;
      myLabel:
      case 2:
        log("c == 2");
        break;
      default:
        log("c != 1");
    }
    // 上面的执行结果为：
    // c == 0
    // c == 2
  }

  void sample3() {
    int a = 1;
    // while 循环（支持 break 和 continue）
    while (a < 3) {
      log("a: $a");
      a++;
    }

    int b = 1;
    // do-while 循环（支持 break 和 continue）
    do {
      log("b: $b");
      b++;
    } while (b < 3);
  }

  void sample4() {
    var a = [1, 2, 3];
    // for 循环（支持 break 和 continue）
    for (var i = 0; i < a.length; i++) {
      log("a:${a[i]}");
    }

    var b = 0;
    // for 循环（括号中的各种表达式不需要的话可以省略）
    for (;;) {
      if (b >= a.length) {
        break;
      }
      log("a:${a[b]}");
      b++;
    }

    // for 循环（foreach 的方式）
    for (var item in a) {
      log("a:$item");
    }

    // 可迭代对象的 forEach 方法
    // 迭代出的元素是 int 类型，每迭代一次就调用一次 myLog(int i) 方法，并为其传递迭代出的数据
    a.forEach(myLog); // 注：不建议在 forEach 中使用匿名函数，比如像这样写 a.forEach((i) { log("$i"); }); 是不被推荐的
  }
  void myLog(int i) {
    log("$i");
  }
}