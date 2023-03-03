/*
 * SizedBox - 确定宽高（SizedBox 会告诉其子元素宽和高是多少）
 */

import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget {
  const SizedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 100,
        /// 结果 Container 的宽为 200，高为 100
        child: Container(
          width: 1,
          height: 1,
          color: Colors.red,
        ),
      ),
    );
  }
}