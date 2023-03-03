/*
 * ConstrainedBox - 约束范围（ConstrainedBox 会告诉其子元素约束范围）
 */

import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// BoxConstraints - 范围约束
        ///   minWidth, maxWidth, minHeight, maxHeight
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: double.infinity,
            minHeight: 100,
            maxHeight: double.infinity,
          ),
          /// 结果 Container 的宽与屏幕的宽相同，高为 100
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.red,
          ),
        ),
        /// 嵌套 ConstrainedBox 时
        ///   多个 minWidth 取最大值
        ///   多个 minHeight 取最大值
        ///   多个 maxWidth 取最小值
        ///   多个 maxHeight 取最小值
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 10,
            maxHeight: 200,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 200,
              maxHeight: 10,
            ),
            /// 结果 Container 的宽为 200，高为 100
            child: Container(
              width: 1,
              height: 200,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}