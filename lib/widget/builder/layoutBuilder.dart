/*
 * LayoutBuilder - 可以拿到父亲的尺寸的 Builder
 *
 * 请先了解 Builder，参见 builder.dart
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class LayoutBuilderDemo extends StatefulWidget {
  const LayoutBuilderDemo({Key? key}) : super(key: key);

  @override
  _LayoutBuilderDemoState createState() => _LayoutBuilderDemoState();
}

class _LayoutBuilderDemoState extends State<LayoutBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 通过 LayoutBuilder 可以拿到父亲的尺寸
        /// 这里拿到的是 Column 的尺寸，我这里的打印结果为 0, 411, 0, true
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return MyText("${constraints.minWidth.toInt()}, ${constraints.maxWidth.toInt()}, ${constraints.minHeight.toInt()}, ${constraints.maxHeight.isInfinite}");
          },
        ),
        SizedBox(
          width: 400,
          height: 100,
          /// 通过 LayoutBuilder 可以拿到父亲的尺寸
          /// 这里拿到的是 SizedBox 的尺寸，我这里的打印结果为 400, 400, 100, 100
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return MyText("${constraints.minWidth.toInt()}, ${constraints.maxWidth.toInt()}, ${constraints.minHeight.toInt()}, ${constraints.maxHeight.toInt()}");
            },
          ),
        )
      ],
    );
  }
}