/*
 * dart 泛型
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartGeneric extends StatelessWidget {
  const DartGeneric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    sample1();

    return MyText(text: "dart_generic");
  }

  void sample1() {
    var a = _MyClass<int>().getType();    // type: int
    var b = _MyClass<String>().getType(); // type: String
    // 实例化时如果不指定泛型的具体类型，那么它就是 dynamic
    var c = _MyClass().getType();         // type: dynamic

    var d = _MyClass2<int>().getType();       // type: int
    // String 没有继承 num 所以这句会报错
    // var e = _MyClass2<String>().getType();
    // 实例化时如果不指定泛型的具体类型，那么它就是泛型约束 extends 所指定的类型，本例中就是 num
    var f = _MyClass2().getType();            // type: num

    var g = _MyClass2<int>();
    // 使用泛型方法
    g.setT(100);
    var h = g.getT();                       // 100
    var i = _MyClass2.getFirst([1, 2, 3]);  // 1

    // 使用泛型扩展方法
    var j = g.getType2();                   // type2: int

    log("$a, $b, $c, $d, $f, $h, $i, $j");
  }
}

// 泛型类
class _MyClass<T> {
  String getType() {
    // 获取泛型的具体类型
    return "type: $T";
  }
}

// 泛型类（通过 extends 为泛型添加约束，约束泛型必须要继承 extends 指定的类）
class _MyClass2<T extends num> {
  String getType() {
    // 获取泛型的具体类型
    return "type: $T";
  }

  // 泛型方法
  T v = 0 as T;
  void setT(T v) {
    this.v = v;
  }
  T getT() {
    return this.v;
  }

  // 泛型方法
  static E getFirst<E>(List<E> list) {
    E tmp = list[0];
    return tmp;
  }
}

// 泛型扩展方法
extension _MyExtension<T extends num> on _MyClass2<T> {
  String getType2() {
    return "type2: $T";
  }
}