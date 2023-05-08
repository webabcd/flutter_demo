/*
 * dart 库的开发和使用（import, export）
 *
 * import 用于从其他 .dart 文件中导入（_ 开头的是私有的不会被导入，非 _ 开头的会被导入）
 * export 用于在一个 .dart 文件中定义需要导出的其他多个 .dart 文件，这样你只用 import 这一个 .dart 文件即可导入此文件中定义的多个 .dart 文件
 * part, part of, library 用于将多个文件合并为一个文件
 *
 * 注：目录名、文件名以及导入时定义的前缀建议用 snake_case 规范命名（避免不同文件系统是否区分大小写的问题），比如 import 'aaa_bbb_ccc.dart' as xxx_yyy_zzz;
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

import 'lib1.dart';                       // lib1.dart 中定义的非 _ 开头的类或函数等都会被导入
import 'lib2.dart' as lib2;               // 通过前缀 lib2. 调用 lib2.dart 中的的非 _ 开头的类或函数等
import 'lib3.dart' show lib3_f1, lib3_f2; // 只导入 lib3.dart 的 lib3_f1, lib3_f2 其他都不导入
import 'lib4.dart' hide lib4_f1, lib4_f2; // lib4.dart 中定义的非 _ 开头的类或函数等都会被导入，但是不包括 lib4_f1, lib4_f2
import 'mylib.dart';                      // 导入 mylib.dart 中的 export 内容
import 'mylib2.dart';                     // 导入 mylib2.dart（通过 part, part of 定义）
import 'mylib3.dart';                     // 导入 mylib3.dart（通过 part, part of, library 定义）


// 引用 dart 语言的内置库的方式
// import 'dart:math';
// 引用 pub 包提供的库的方式
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// 引用本地文件的方式
// import './lib1.dart';


class DartPackage extends StatelessWidget {
  const DartPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    sample1();

    return const MyWidget(text: "dart_package_demo");
  }

  void sample1() {
    lib1_f1();
    // _lib1_f2();    // _ 开头的无法导入

    lib2.lib2_f1();   // 因为通过 as lib2 导入，所以需要通过前缀 lib2. 访问

    lib3_f1();
    lib3_f2();
    // lib3_f3();     // 不在 import 的 show 里，所以无法访问

    // lib4_f1();     // 在 import 的 hide 里，所以无法访问
    // lib4_f2();     // 在 import 的 hide 里，所以无法访问
    lib4_f3();

    lib5_f1();
    lib5_f2();
    lib5_f3();
    lib6_f1();
    // lib6_f2();     // 不在 export 的 show 里，所以无法访问
    // lib6_f3();     // 不在 export 的 show 里，所以无法访问
    // lib7_f1();     // 在 export 的 hide 里，所以无法访问
    lib7_f2();
    lib7_f3();
    mylib_f1();

    lib8_f1();
    lib9_f1();
    mylib2_f1();

    lib10_f1();
    lib11_f1();
    mylib3_f1();
  }
}