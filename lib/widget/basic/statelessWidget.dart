/*
 * StatelessWidget 无状态 widget
 *
 * 无状态 widget 的意思是：内容确定之后，自己无法修改自己的内容
 * 有状态 widget 的意思是：内容确定之后，自己可以修改自己的内容
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class StatelessWidgetDemo extends StatelessWidget {
  const StatelessWidgetDemo({Key? key}) : super(key: key);

  // build() 用于创建这个 widget 并渲染
  @override
  Widget build(BuildContext context) {
    return const MyWidget(text: "StatelessWidgetDemo");
  }
}
