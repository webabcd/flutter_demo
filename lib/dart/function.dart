/*
 * dart 函数（函数基础，箭头函数，可选参数，命名参数，函数作为参数，匿名函数，嵌套函数，闭包函数）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartFunction extends StatelessWidget {
  const DartFunction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*
     * main() 函数是应用程序的入口点
     * void main() {
     * }
     *
     * main() 函数是应用程序的入口点（如需获取命令行参数，则可以通过如下方式获取）
     * void main(List<String> arguments) {
     * }
     */

    // 函数基础，箭头函数
    sample1();
    // 可选参数，命名参数
    sample2();
    // 函数作为参数，匿名函数，嵌套函数
    sample3();
    // 闭包函数
    sample4();

    return const MyWidget(text: "dart_function");
  }

  void sample1() {
    var a = f1("abc", 123); // abc, 123
    var b = f2("webabcd");  // hello: webabcd
    var c = f3();           // null

    log("$a, $b, $c");
  }
  // 函数基础（允许不指定参数类型，但还是建议为每个参数指定参数类型）
  String f1(a, int b) {
    return "$a, $b";
  }
  // 箭头函数（只能使用简单表达式）
  String f2(String a) => "hello: $a";
  // 如果不指定返回值类型的话，则函数结束后会自动 return null（注：无返回值的类型是 void）
  f3() {

  }

  void sample2() {
    var a = f4("a");            // a, b, null
    var b = f4("a", "b");       // a, b, null
    var c = f4("a", "b", "c");  // a, b, c

    var d = f5("a", d:"d");               // a, b, null, d
    var e = f5("a", d:"d", c:"c", b:"b"); // a, b, c, d

    log("$a, $b, $c, $d, $e");
  }
  // [] 中定义的参数为可选参数，允许为可选参数提供默认值，允许调用时不传递可空类型的可选参数
  String f4(String a, [String b = "b", String? c]) {
    return "$a, $b, $c";
  }
  // {} 中定义的参数为命名参数（调用时需要指定参数名称，允许不按顺序调用）
  // 允许为命名参数提供默认值，允许调用时不传递可空类型的命名参数（如果你要求可空类型的命名参数必须要传递，则使用 required 修饰即可）
  String f5(String a, {String b = "b", String? c, required String? d}) {
    return "$a, $b, $c, $d";
  }

  void sample3() {
    // 函数作为参数的示例
    [1, 2, 3].forEach(f6);
    // 使用匿名函数的示例
    // 本例仅演示用，实际开发不建议在 forEach() 中使用匿名函数，比如下面这句建议写成上面的方式，或者写成 for (var element in [1, 2, 3]) {}
    [1, 2, 3].forEach((element) {
      log("$element");
    });

    // 传递函数类型参数时使用匿名函数
    f7("webabcd", (element) {
      log("hello1: $element");
    });

    // 传递函数类型参数时使用非匿名函数（myF1() 函数是一个嵌套函数）
    myF1(element) {
      log("hello2: $element");
    }
    f7("webabcd", myF1);

    // 传递函数类型参数时使用非匿名函数（箭头函数的方式，myF2() 函数是一个嵌套函数）
    myF2(element) => log("hello3: $element");
    f7("webabcd", myF2);

    // 在 dart 中一切皆对象，函数也是一个对象，允许将函数赋值给一个变量
    // 本例仅演示用，实际开发不建议这样做，建议用上面那几种方式
    var a = (element) {
      log("hello4: $element");
    };
    f7("webabcd", a);

    // 传递有返回值的函数类型参数
    var b = f8("webabcd", (element) {
      return "hello5: $element";
    });
    log(b);
  }
  void f6(int i) {
    log("$i");
  }
  // 第 2 个参数的类型是一个无返回值的函数
  void f7(String a, void Function(String element) action) {
    action(a);
  }
  // 第 2 个参数的类型是一个有返回值的函数
  String f8(String a, String Function(String element) func) {
    return func(a);
  }

  void sample4() {
    // 获取一个闭包
    var a = f9(2);

    // 闭包引用的闭包外的变量的生命周期会拉长到与闭包一致
    var c = a();
    var d = a();
    var e = a();

    log("$c, $d, $e"); // 2, 4, 6
  }
  // f9() 函数的返回值类型是 Function（即返回值是一个函数）
  // 函数返回的函数就是一个闭包（closure）
  Function f9(int a) {
    // 闭包外的变量
    var total = 0;

    int myFunc() {
      // 闭包的特性：闭包引用的闭包外的变量的生命周期会拉长到与闭包一致
      total += a;
      return total;
    }
    // 返回一个闭包
    return myFunc;
  }
}