/*
 * dart 概述
 *
 * 注：
 * 1、在 dart 中一切都是对象，除了 null 外都继承自 Object
 * 2、_ 开头代表 private，否则为 public
 * 3、类用 UpperCamelCase 规范命名，变量等用 lowerCamelCase 规范命名
 * 4、目录名、文件名以及导入时定义的前缀用 lower_lower 规范命名（避免不同文件系统是否区分大小写的问题），比如 import 'aaa_bbb_ccc.dart' as xxx_yyy_zzz;
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartSummary extends StatelessWidget {
  const DartSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 单行注释

    /*
      多行注释
     */

    /*
    /*
      多行注释支持嵌套
     */
     */

    /// 用于生成文档的注释
    /**
     * 用于生成文档的注释
     */

    // 声明变量，final，const
    sample1();
    // 变量初始化，late，?
    sample2();
    // 类型别名
    sample3();
    // 几个最佳实践
    sample4();

    return const MyWidget(text: "dart_summary");
  }

  void sample1() {
    // 声明指定类型的变量，并初始化
    // 字符串可以用双引号，也可以用单引号
    String a = 'a';

    // 通过 var 声明变量，然后根据初始化数据推导变量的类型（这是推荐的方式）
    var b = "b";

    // final 常量，允许被设置一次
    final String c;
    c = "c";        // 可以被设置一次
    // c = "cc";    // 会报错
    final d = "d";  // 声明的同时被设置了
    // d = "dd";    // 会报错

    // const 常量（编译时常量），在编译时就要确定，不可修改
    const e = "e";
    // const 也可以用来声明通过构造函数返回的对象（下面的 [1, 2, 3] 其实就是调用 List 构造函数返回的一个 List 对象）
    var f = const [1, 2, 3];
    // f[0] = 100;      // 这句会编译时报错的，因为 f 指向的对象是 const 的，其内容不可修改
    f = [4, 5, 6];      // 这句运行正常，因为 f 自己不是 const 的，所以可以让 f 指向别的数据

    const g = [1, 2, 3];
    // g[0] = 100;      // 这句会报错，你不能修改 const 常量引用的内容中的任何数据（因为在 dart 中 const 常量引用的内容也都会被自动标记为 const）
    // g = [4, 5, 6];   // 这句会报错，你不能让 const 常量引用别的数据

    var h = [1, 2, 3] == [1, 2, 3];             // false（即使数据相同，这两个对象也不是同一个对象）
    var i = const [1, 2, 3] == const [1, 2, 3]; // true（如果 const 的两个数据相同，则这两个对象是同一个对象）

    // 再看看 final 常量
    final j = [1, 2, 3];  // 声明的同时被设置了
    // j = [4, 5, 6];     // 会报错
    j[2] = 100;           // 这句是正常的（你虽然不能再让 final 常量引用别的数据，但是你可以修改 final 常量引用的内容中的数据）

    log("$a, $b, $c, $d, $e, $f, $g, $h, $i, $j");
  }

  void sample2() {
    // 声明变量的时候可以不初始化，但是使用前必须初始化（由编译器检查）
    String a;
    a = "a";

    // 声明变量的时候可以不初始化，但是使用前必须初始化（由编译器检查）
    // 但是有的时候编译器可能会判断失误，发生这种情况时可以加上 late 关键字，不让编译器检查
    late String b;
    b = "b";
    // late 关键字还可以用于延迟加载
    late String c = _lateDemo();          // 因为 late 关键字的原因，这里不会调用 _lateDemo() 方法
    log("late String c = _lateDemo();");
    log(c);                               // 当你使用 c 时，才会调用 _lateDemo() 方法

    // 通过 ? 可以声明可空类型（即允许不初始化），默认值为 null
    String? d;
    int? e;

    log("$a, $b, ${ d == null }, ${ e == null }");
  }
  String _lateDemo() {
    log("invoke _lateDemo");
    return "return _lateDemo";
  }

  void sample3() {
    MyInt a = 1;
    // MyInt 实际上就是 int
    var b = a.runtimeType.toString(); // int

    int plus(int a, int b) => a + b;
    // plus() 函数的类型是 int Function(int a, int b)，也就是说 plus() 函数的类型是 MyFunc
    var c = plus is MyFunc;           // true

    log("$a, $b, $c");
  }

  void sample4() {
    String? a; // 默认就是 null，不建议写成 String? a = null;
    var b = 'a' // 拼接多个字符串时建议不用使用 + 号
        'b';
    var c = "hello: $b"; // 格式化字符串时尽量用 $ 而不是用 + 号拼接
    var d = [1, 2, 3].isEmpty; // 判断一个可迭代对象是否为空建议用 isEmpty 属性而不要使用 length 属性（可能会比较慢）
    var e = [
      1,
      2,
      3,  // 分行定义 List, Set, Map 中的元素时，建议结尾的元素后面也加上逗号，这样会方便你的各种修改
    ];
  }
}

// 为某个类指定类型别名
typedef MyInt = int;
// 为某个函数类型指定类型别名
typedef MyFunc = int Function(int a, int b);