/*
 * dart 错误处理
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartException extends StatelessWidget {
  const DartException({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // assert 的用法
    sample1();
    // try
    sample2();

    return MyText(text: "dart_exception");
  }

  void sample1() {
    // assert 断言，条件为假则中断运行
    // assert 仅在调试模式下有效
    // assert(1 == 2);
  }

  void sample2() {
    try {                         // try
      throw "this an exception";  // 抛出一个对象，可以是任意类型（建议抛出 Error 或 Exception）
    } on Exception {              // on 用于指定捕获的类型，如果捕获到的对象是 Exception 类型则执行此句

    } on String catch(e, s) {     // catch 用于捕获对象，其中 e 是捕获到的对象，s 是堆栈信息（一个 StackTrace 对象），如果捕获到的对象是 String 类型则执行此句
      log("ex: $e, $s");
    } catch (e) {                 // 没有 on 的意思就是捕获所有类型的对象，上面的 on 都捕获不到对象的话，就会执行此句
      rethrow;                    // 向外抛出捕获到的对象
    } finally {                   // finally
      log("finally");
    }
  }
}