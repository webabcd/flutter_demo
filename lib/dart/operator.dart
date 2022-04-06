/*
 * dart 运算符
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartOperator extends StatelessWidget {
  const DartOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // + - * / % ++ -- ! << >> >>>（无符号右移） & ^ | > < >= <= == != && || = += -+ *= /= &= ^=
    // ~expr 位运算（0 变为 1，1 变为 0），比如 ~0101 的结果为 1010

    // ~/
    sample1();

    // as is is!
    sample2();

    // expr1 ? expr2 : expr3
    // expr1 ?? expr2
    // ?. !.
    // ?[] ![]
    sample3();

    // .. ?..
    sample4();

    return const MyWidget(text: "dart_operator");
  }

  void sample1() {
    // ~/ 相除后取整数部分
    var a = 17 ~/ 5;

    log("$a");
  }

  void sample2() {
    Object a = "abc";                 // abc
    // 通过 as 转换数据类型
    String b = a as String;           // abc
    // 通过 is 判断数据类型是否相同
    var c = b is String;              // true
    // 通过 is! 判断数据类型是否不同
    var d = b is! String;             // false

    log("$a, $b, $c, $d");
  }

  void sample3() {
    String? a;

    // expr1 ? expr2 : expr3
    var b = a == null ? "a == null" : "a";

    // expr1 ?? expr2
    var c = a ?? "b == null";

    // ?. 如果左边是 null 则需要返回值的就返回 null 不需要返回值的就什么都不执行
    var d = a?.length;
    // !. 如果左边是 null 则运行时会出现异常
    // var e = a!.length;

    List<int>? f;
    // ?[] 如果左边是 null 则返回 null
    var g = f?[0];
    // ![] 如果左边是 null 则运行时会出现异常
    // var h = f![0];

    log("$a, $b, $c, $d, $f, $g");
  }

  void sample4() {
    // .. 和 ?.. 是级联符号（cascade notation），用于对一个对象做一系列的操作
    // 下面的示例用于说明 .. 的用法（?.. 就是加了一个检查对象是否为 null 的判断，如果对象是 null 就什么都不做）
    var a = _MyPoint()
      ..x = 1
      ..initY()
      ..z = 3;

    log("$a"); // 1, 2, 3
  }
}
class _MyPoint {
  num x = 0;
  num y = 0;
  num z = 0;

  void initY() {
    y = 2;
  }

  @override
  String toString() {
    return "$x, $y, $z";
  }
}