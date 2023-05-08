import 'package:flutter_demo/helper.dart';

// mylib2.dart 是主文件，这个文件会自动将 lib8.dart, lib9.dart 合并进来
part 'lib8.dart';   // lib8.dart 需要在文件的顶部使用 part of
part 'lib9.dart';   // lib9.dart 需要在文件的顶部使用 part of

void mylib2_f1() {
  log("mylib2_f1");
}