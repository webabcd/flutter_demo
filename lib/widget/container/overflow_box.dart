/*
 * OverflowBox - 可溢出
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class OverflowBoxDemo extends StatelessWidget {
  const OverflowBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// OverflowBox 的宽高与父相同
    /// OverflowBox 会让其  child 自行决定宽高，如果超过了 OverflowBox 的宽高也不会有溢出警告
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      /// child 相对于父 OverflowBox 的对齐方式
      alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.red,
        /// 溢出就溢出了不会有溢出警告（注，如果设置为 double.infinity 无限大，则会因 flutter 无法渲染而导致异常）
        width: 999999,
        height: 50,
        alignment: Alignment.centerLeft,
        child: MyText("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"),
      ),
    );
  }
}