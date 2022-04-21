/*
 * ElevatedButton - 自带背景色按钮
 *
 * TextButton 是默认啥都没有的按钮，OutlinedButton 是默认有边框的按钮，ElevatedButton 是默认有背景色的按钮
 */

import 'package:flutter/material.dart';

class ElevatedButtonDemo extends StatelessWidget {
  const ElevatedButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  ElevatedButton(
        child: Text('button'),
        onPressed: () {},
        style: ElevatedButton.styleFrom(  /// 关于按钮样式请参见 lib/widget/button/textButton.dart 中的说明

        ),
      ),
    );
  }
}