/*
 * FittedBox - 自适应
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class FittedBoxDemo extends StatelessWidget {
  const FittedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          /// Container 的宽高与父相同
          /// Container 会让其 child 自行决定宽高
          child: Container(
            color: Colors.red,
            /// FittedBox 的宽高与父相同
            /// FittedBox 会让其 child 做缩放，使其适应 FittedBox 的宽高
            child: const FittedBox(
              child: MyText('abc'),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            /// Center 的宽高与父相同
            /// Center 会让其 child 自行决定宽高，只要不超过 Center 的宽高即可
            child: const Center(
              /// 如果 FittedBox 的 child 的尺寸没有超过父 Center
              /// 则 FittedBox 的宽高会调整为与其 child 一致
              child: FittedBox(
                child: MyText('abc'),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            /// Center 的宽高与父相同
            /// Center 会让其 child 自行决定宽高，只要不超过 Center 的宽高即可
            child: const Center(
              child: FittedBox(
                /// 如果 FittedBox 的 child 的尺寸超过了父 Center
                /// 则 FittedBox 会让其 child 做缩放，使之适应 Center 的宽高，然后再将 FittedBox 自己的尺寸调整为与其缩放后的 child 一致
                child: MyText('abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'),
              ),
            ),
          ),
        ),

        const Expanded(
          child: FittedBox(
            /// child 相对于 FittedBox 的对齐方式
            alignment: Alignment.centerRight,
            /// child 的拉伸方式（参见 /lib/widget/media/image.dart 中的相关说明）
            fit: BoxFit.fitHeight,
            child: MyText('W'),
          ),
        ),
      ],
    );
  }
}