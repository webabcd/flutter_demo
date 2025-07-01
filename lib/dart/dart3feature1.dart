/*
 * dart 3 新特性（元组，解构，switch 的模式匹配）
 *
 * dart 3 中新增了 Record 和 Pattern
 * Record 就是元组
 * Pattern 就是解构和 switch 的模式匹配
 *
 *
 * 升级 dart 需要先在 pubspec.yaml 中做如下配置，然后 flutter upgrade
 * environment:
 *   sdk: ">=3.0.0 <=3.1.2"
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class Dart3Feature1 extends StatelessWidget {
  const Dart3Feature1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 元组
    sample1();
    // 一般数据的解构
    sample2();
    // json 数据的解构
    sample3();
    // 对象属性的解构
    sample4();
    // switch 的模式匹配
    sample5();

    return const MyWidget(text: "dart 3 新特性（元组，解构，switch 的模式匹配）");
  }

  void sample1() {
    // 元组用于将多个值组合成一个复合值
    var record1 = (1, "a", key:"value", );
    var a = record1.$1;   // 获取元组中的指定的元素的值，只能 get 不能 set
    var b = record1.$2;   // 获取元组中的指定的元素的值，只能 get 不能 set
    var c = record1.key;  // 获取元组中的指定的元素的值，只能 get 不能 set
    log("$a, $b, $c");

    // 定义元组的类型
    (int, String, {String key}) record2 = (1, "a", key:"value", );
    var d = record2.$1;
    var e = record2.$2;
    var f = record2.key;
    log("$d, $e, $f");

    // 判断两个元组是否相等
    var g = record1 == record2;
    // 判断元组的类型
    var h = record1 is (int, String, {String key});
    log("$g, $h");

    // 函数的返回值可以是一个元组类型
    var record3 = f1();
    log("${record3.$1}, ${record3.$2}");
  }
  // 函数的返回值可以是一个元组类型
  (String, int) f1() {
    return ("webabcd", 43);
  }

  void sample2() {
    // 解构一个元组数据
    var (name, age) = ("webabcd", 43);
    log("$name, $age");

    // 解构一个 List 数据
    var list = [1, 2, 3];
    var [a, b, c] = list;
    log("$a, $b, $c");

    // 解构一个 Map 数据
    var map = {"k1":"v1", "k2":"v2", };
    var {"k1":d, "k2":e} = map;
    log("$d, $e");

    Map<String, String> map2 = {'k1':'v1', 'k2':'v2', };
    // 解构一个 MapEntry 数据（一般写法）
    for (var MapEntry(key: myKey, value: myValue) in map2.entries) {
      log('$myKey, $myValue');
    }
    // 解构一个 MapEntry 数据（简便写法）
    for (var MapEntry(:key, :value) in map2.entries) {
      log('$key, $value');
    }

    var (f, g) = ('left', 'right');
    // 通过解构的方式交换两个变量
    (g, f) = (f, g);
    log('$f, $g');
  }

  void sample3() {
    var json = {
      'user': ['webabcd', 43]
    };

    // 解构一个 json 数据
    var {'user': [name, age]} = json;
    log("$name, $age");

    // 通过 case 实现如下逻辑
    // 如果一个 json 数据符合指定的类型，则返回 true 并解构
    if (json case {'user': [String name, int age]}) {
      log("$name, $age");
    }
  }

  void sample4() {
    var obj = _MyClass1(name: "webabcd", age: 43);

    // 解构一个对象的属性（一般写法）
    var _MyClass1(name:myName, age:myAge) = obj;
    log("$myName, $myAge");

    // 解构一个对象的属性（简便写法）
    var _MyClass1(:name, :age) = obj;
    log("$name, $age");
  }

  void sample5() {
    // 在 dart 3 中 switch 除了支持传统的常量匹配方式之外，还支持如下的模式匹配方式

    // 如果 List 中的第 1 个元素是 1 或 2，则 case 匹配成功，同时会将 List 中的第 2 个元素赋值给 a，将 List 中的第 3 个元素赋值给 b
    switch ([1, 10, 100]) {
      case [1 || 2, var a, var b]:
        log("$a, $b"); // 10, 100
    }

    // 支持条件匹配
    switch (10) {
      case >= 0 && <= 100:
        log(">= 0 && <= 100"); // >= 0 && <= 100
    }

    // 支持返回值（根据匹配的条件，返回指定的值）
    var c = switch (Colors.red) {
      Colors.red || Colors.green || Colors.blue => "red || green || blue",
      Colors.orange => "orange",
      _ => "other",
    };
    log(c); // red || green || blue

    // 通过 case 解构，并通过 when 匹配解构后的值
    switch (Colors.red) {
      case Color(value: var d) when d > 100:
        log("$d, ${Color(d)}"); // 4294198070, Color(0xfff44336)
    }
  }
}

class _MyClass1 {
  String name;
  int age;
  _MyClass1({required this.name, required this.age});
}