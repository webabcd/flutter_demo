/*
 * StatefulBuilder - 有状态的 Builder
 *
 * 请先了解 Builder，参见 builder.dart
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class StatefulBuilderDemo extends StatefulWidget {
  const StatefulBuilderDemo({Key? key}) : super(key: key);

  @override
  _StatefulBuilderDemoState createState() => _StatefulBuilderDemoState();
}

class _StatefulBuilderDemoState extends State<StatefulBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText('counter: $counter'),
        Builder(
          builder: (BuildContext context) {
            /// 相对于 Builder 来说，StatefulBuilder 会多出一个 StateSetter 类型的对象
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return TextButton(
                      onPressed: () {
                        /// 可以通过 StateSetter 对象修改状态，其会让对应的 StatefulBuilder 重绘，而 StatefulBuilder 之外的部分不会重绘
                        setState(() => { counter++ });
                      },
                      child: Text('counter: $counter')
                  );
                }
            );
          },
        ),
      ],
    );
  }
}