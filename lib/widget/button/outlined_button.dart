/*
 * OutlinedButton - 自带边框按钮
 *
 * TextButton 是默认啥都没有的按钮，OutlinedButton 是默认有边框的按钮，ElevatedButton 是默认有背景色的按钮
 */

import 'package:flutter/material.dart';

class OutlinedButtonDemo extends StatelessWidget {
  const OutlinedButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  OutlinedButton(
        child: Text('button'),
        onPressed: () {},
        style: OutlinedButton.styleFrom(  /// 关于按钮样式请参见 lib/widget/button/text_button.dart 中的说明
          primary: Colors.white,
          backgroundColor: Colors.blue,
          side: BorderSide(               ///   按钮边框的大小和颜色
              width: 2,
              color: Colors.red
          ),
          shape: const StadiumBorder(),   ///   按钮的边框的样式（注：按钮边框的大小和颜色请在 style 的 side 中设置）
        ),
      ),
    );
  }
}