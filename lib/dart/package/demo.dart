/*
 * dart 错误处理
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DartPackage extends StatelessWidget {
  const DartPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    sample1();


    return MyText(text: "dart_package_demo");
  }

  void sample1() {
    log("dddd");
  }
}