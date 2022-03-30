/*
 * dart 类（类基础，构造函数，枚举）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartClass1 extends StatelessWidget {
  const DartClass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 类基础
    sample1();
    // 构造函数
    sample2();
    // 枚举
    sample3();

    return MyText(text: "dart_class1");
  }

  void sample1() {
    // 实例化时可以省略 new
    // 关于 .. 运算符的说明请参见 dart_operator.dart
    var a = _MyClass1("webabcd", 40)
      ..salary = 4000;
    var b = a.name;
    var c = a.getInfo();

    // _MyClass1 的自定义的 + 逻辑，详见 _MyClass1 中的 operator 定义
    var d = a + _MyClass1("wanglei", 50)
      ..salary = 6000;
    var e = d.getInfo();

    var f = _MyClass1.version;
    var g = _MyClass1.getVersion();

    log("$b, $c, $e, $f, $g");
  }

  void sample2() {
    // 无名构造函数（无名构造函数只能有一个，如果你不定义无名构造函数，那么默认会有一个无参数的无名构造函数）
    var a = _MyClass2("webabcd", 40);

    // 有名构造函数（有名构造函数允许有多个）
    var b = _MyClass2.constructor1("webabcd", 40);
    var c = _MyClass2.constructor2(40);
    var d = _MyClass2.constructor3("webabcd", 40);

    // f 和 e 是同一个对象
    var e = _MyClass2.constructor4("webabcd", 40);
    var f = _MyClass2.constructor4("webabcd", 40);

    log("$a, $b, $c, $d, ${ e == f }");
  }

  void sample3() {
    var a = _MyColor.green;
    // 判断枚举值是否相等
    var b = a == _MyColor.green;  // true
    // 获取枚举的 index
    var c = _MyColor.green.index; // 1
    // 获取枚举的 name
    var d = _MyColor.green.name;  // green

    // 遍历枚举的 index 和 name
    List<_MyColor> colors = _MyColor.values;
    for (var color in colors) {
      log("index:${color.index}, name:${color.name}");
    }

    log("$b, $c, $d");
  }
}

// 类（_ 开头代表 private，否则为 public）
class _MyClass1 {
  // 实例属性（_ 开头代表 private，否则为 public）
  String name;
  double age;

  // 构造函数的语法糖（syntactic sugar）技术
  _MyClass1(this.name, this.age); // 第 1 个参数赋值给 name 属性，第 2 个参数赋值给 age 属性

  // 实例方法（_ 开头代表 private，否则为 public）
  String getInfo() {
    return "name:$name, age:$age, salary:$salary";
  }

  // 属性的 getter 和 setter
  num _salary = 0;
  num get salary => _salary;
  set salary(num value) => _salary = value;

  // 定义运算符（本例用于定义 _MyClass1 对象的 + 运算符的实现）
  _MyClass1 operator +(_MyClass1 v) => _MyClass1(name + v.name, age + v.age);

  // 类属性
  static double version = 1.1;
  // 类方法
  static double getVersion() {
    return version;
  }
}

class _MyClass2 {
  String name = "";
  double age = 0;

  /*
  // 常规的定义构造函数的方式
  _MyClass2(String name, double age) {
    this.name = name;
    this.age = age;
  }
  */
  // 因为 dart 支持构造函数的语法糖（syntactic sugar）技术，下面这句等同于上面那句
  _MyClass2(this.name, this.age);

  // dart 中无名构造函数只能有一个，如果你不定义无名构造函数，那么默认会有一个无参数的无名构造函数
  // 如果需要定义多个不同的构造函数怎么办？你可以像下面这样定义有名的构造函数

  // 有名构造函数（也支持语法糖技术）
  // _ 开头代表 private，否则为 public
  _MyClass2.constructor1(this.name, this.age);

  // 构造函数可以重定向到其他构造函数
  _MyClass2.constructor2(double age) : this("webabcd", age);

  // 在执行构造函数逻辑之前，可以先做属性的初始化
  _MyClass2.constructor3(String name, double age)
      : this.name = name + "2",
        this.age = age * 2 {
    this.age += 2;
  }

  // 如果你的构造函数不总是返回类的新的实例的话，则请使用 factory 关键字
  static final Map<String, _MyClass2> _cache = <String, _MyClass2>{};
  factory _MyClass2.constructor4(String name, double age) {
    return _cache.putIfAbsent(name, () => _MyClass2(name, age));
  }

  @override
  String toString() {
    return "name:$name, age:$age";
  }
}

// 枚举
enum _MyColor { red, green, blue }