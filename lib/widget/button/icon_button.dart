/*
 * IconButton - 图标按钮
 *
 * 图标相关请参见 lib/widget/media/icon.dart
 */

import 'package:flutter/material.dart';

class IconButtonDemo extends StatelessWidget {
  const IconButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 注：IconButton 必须放到一个 Material 组件内，否则会报错
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () { },                    /// 单击事件，此为 required 字段（设置为 null 则代表按钮是 disable 状态）
            icon: const Icon(                     /// 图标
                Icons.favorite,
                size: 24
            ),
            padding: const EdgeInsets.all(0),     /// 内边距
            alignment: Alignment.center,          /// 对齐方式
            color: Colors.red,                    /// 颜色
            highlightColor: Colors.green,         /// 点击时动画效果的颜色
          ),
          IconButton(
            onPressed: () { },
            icon: const Icon(Icons.favorite, size: 24),
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerLeft,
            color: Colors.red,
            splashColor: Colors.green,            /// 点击时动画效果的颜色
          ),
          const IconButton(
            onPressed: null,                      /// disable 状态的按钮
            icon: Icon(Icons.favorite, size: 24),
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            color: Colors.red,
            disabledColor: Colors.green,          /// 按钮 disable 状态时的颜色
          ),
        ],
      ),
    );
  }
}