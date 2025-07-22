/*
 * dart 3 新特性（类相关）
 *
 *
 * 升级 dart 需要先在 pubspec.yaml 中做如下配置，然后 flutter upgrade
 * environment:
 *   sdk: ">=3.0.0 <=3.1.2"
 * 或者
 * environment:
 *   sdk: ^3.3.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class Dart3Feature2 extends StatelessWidget {
  const Dart3Feature2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // mixin - 混入，相关说明参见 class2.dart
    // abstract - 抽象类，不允许实例化，相关说明参见 class2.dart

    // sealed 修饰的类的子类可以通过 switch 选择
    _MySealedClass a = _MyClass3();
    var b = switch(a) {
      _MyClass1() => '_MyClass1',
      _MyClass2() => '_MyClass2',
      _MyClass3() => '_MyClass3',
    };
    log(b); // _MyClass3

    // 枚举支持重写基类的抽象方法
    var c = MyEnum.xxx;
    log("${c.plus()}"); // 3

    return const MyWidget(text: "dart 3 新特性（类相关）");
  }
}


// final 修饰的类不允许被继承
final class _MyFinalClass {
  hello() { }
}


// sealed 修饰的类不允许实例化，且不允许在外部被继承（在同文件中是可以被继承的）
// sealed 修饰的类的子类可以通过 switch 选择
sealed class _MySealedClass {
  hello() { }
}
class _MyClass1 extends _MySealedClass {
  @override
  hello() { }
}
class _MyClass2 extends _MySealedClass {
  @override
  hello() { }
}
class _MyClass3 extends _MySealedClass {
  @override
  hello() { }
}


// base 修饰的类只能被 extends 而不能被 implements
// 如果一个类没有用 base 或 interface 修饰，则它既可以被 extends 也可以被 implements（相关说明参见 class2.dart）
base class _MyBaseClass {
  hello() { }
}
// 一个类如果 extends 了一个 base 修饰的类，则这个类也必须用 base 修饰
base class _MyClass4 extends _MyBaseClass {
  @override
  hello() { }
}


// interface 修饰的类只能被 implements 而不能被 extends
// 如果一个类没有用 base 或 interface 修饰，则它既可以被 extends 也可以被 implements（相关说明参见 class2.dart）
interface class _MyInterfaceClass {
  hello() { }
}
class _MyClass5 implements _MyInterfaceClass {
  @override
  hello() { }
}


// class 支持 abstract 和 interface 同时修饰
abstract interface class _MyAbstractInterface {
  int plus();
}
// 枚举可以继承 abstract 和 interface 同时修饰的类
enum MyEnum implements _MyAbstractInterface {
  xxx(1, 2);

  final int value1;
  final int value2;
  const MyEnum(this.value1, this.value2);

  // 枚举支持重写基类的抽象方法
  @override
  int plus() => value1 + value2;
}