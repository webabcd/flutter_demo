// 当前的库名为 mylib3（要与当前文件的文件名 mylib3.dart 一致）
// 这样，需要被合并进来的文件在文件的顶部声明 part of mylib3; 即可
library mylib3;

import 'package:flutter_demo/helper.dart';

// mylib3.dart 是主文件，这个文件会自动将 lib10.dart, lib11.dart 合并进来
part 'lib10.dart';    // lib10.dart 需要在文件的顶部使用 part of
part 'lib11.dart';    // lib11.dart 需要在文件的顶部使用 part of

void mylib3_f1() {
  log("mylib3_f1");
}