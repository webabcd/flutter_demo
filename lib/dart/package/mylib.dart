import 'package:flutter_demo/helper.dart';

// mylib.dart 被其他文件 import 后，这里的 export 的文件也会被自动 import
export 'lib5.dart';
export 'lib6.dart' show lib6_f1;  // export 支持 show（用法和 import 的一样）
export 'lib7.dart' hide lib7_f1;  // export 支持 hide（用法和 import 的一样）

void mylib_f1() {
  log("mylib_f1");
}