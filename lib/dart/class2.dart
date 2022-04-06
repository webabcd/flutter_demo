/*
 * dart 类（抽象类，接口，继承，混入，扩展方法）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartClass2 extends StatelessWidget {
  const DartClass2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    sample1();

    return const MyWidget(text: "dart_class2");
  }

  void sample1() {
    var a = _MyClass("webabcd", 50);
    var b = a.getInfo();
    var c = a.getInfo2();
    var d = a.getInfo3();
    var e = a.getInfo4();
    var f = a.getInfo5();
    var g = a.getInfo6();
    var h = a.getInfo7();

    log("$b, $c, $d, $e, $f, $g, $h");
  }
}

// 抽象类
abstract class _MyAbstract {
  // 抽象方法
  String getInfo();
  // 有具体实现的方法
  String getInfo2() {
    return "getInfo2";
  }
}

// 接口（接口也是 class，当你通过 implements 实现的时候，此 class 就当做 interface 用，你需要实现此 class 中的全部方法和属性）
class _MyClassInterface1 {
  // 实现此接口的类必须要实现此方法
  String getInfo3() {
    return "_MyClassInterface1";
  }
}

// 接口
class _MyClassInterface2 {
  // 实现此接口的类必须要实现此方法
  String getInfo4() {
    return "_MyClassInterface3";
  }
}

// 混入，用于强行将此实现附加到指定的类中，混入与被混入之间没有继承关系
mixin _MyMixin1 {
  String getInfo5() {
    return "getInfo5()";
  }
}

// on 用于说明，只有指定类型的类才能混入此 mixin
// 只有 _MyAbstract 或 _MyAbstract 的子类才能附加 _MyMixin2
mixin _MyMixin2 on _MyAbstract {
  String getInfo6() {
    return "getInfo6()";
  }
}

// 继承抽象类
class _MyClassBase extends _MyAbstract {
  String name;

  _MyClassBase(this.name);

  @override
  String getInfo() {
    return "name:$name";
  }
}

// 顺序是先 extends 再 with 再 implements
// extends - 继承其他的类或抽象类，只能继承一个
// with - 混入 mixin，允许混入多个 mixin
// implements - 实现接口，允许实现多个接口
class _MyClass extends _MyClassBase with _MyMixin1, _MyMixin2 implements _MyClassInterface1, _MyClassInterface2 {
  double age;

  // 定义构造函数，以及调用基类的构造函数
  _MyClass(String name, this.age) : super(name) {

  }

  // 重写基类的方法
  @override
  String getInfo() {
    return super.getInfo() + ", age:$age";
  }

  // 实现 _MyClassInterface1 接口的方法
  @override
  String getInfo3() {
    // 你不能 super.getInfo3() 因为类 _MyClassInterface1 是当做接口用的
    return "getInfo3()";
  }

  // 实现 _MyClassInterface2 接口的方法
  @override
  String getInfo4() {
    // 你不能 super.getInfo4() 因为类 _MyClassInterface2 是当做接口用的
    return "getInfo4()";
  }
}

// 扩展方法（_ 开头代表 private，否则为 public）
// 为 _MyClass 类扩展出 getInfo7() 方法
extension _MyExtension on _MyClass {
  String getInfo7() {
    return "getInfo7()";
  }
}