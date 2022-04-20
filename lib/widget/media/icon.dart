/*
 * Icon - 图标
 *
 * 注：Icons 中的字体使用的是 Material Design 字体中的图标，需要在 pubspec.yaml 中配置 uses-material-design: true
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class IconDemo extends StatelessWidget {
  const IconDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// 获取 Icons.favorite 图标的编码，结果是 e25b
    log("Icons.favorite: ${Icons.favorite.codePoint.toRadixString(16)}");

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        /// Icon - 图标（使用的是 Material Design 字体中的图标）
        Icon(
          Icons.favorite,         /// 图标类型（一个 IconData 类型的对象）
          color: Colors.orange,   /// 颜色
          size: 48,               /// 大小
        ),
        Text(
          "\uE25B",               /// Icons.favorite 的编码是 E25B，所以可以通过 Text 显示这个图标（注：fontFamily 要设置为 MaterialIcons）
          style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 48,
            color: Colors.orange,
            decoration: TextDecoration.none,
          ),
        ),
        Icon(
          IconData(               /// 可以自定义 IconData 对象（比如你想使用自己的字体文件中的图标，除了直接通过 Text 的方式显示外，也可以用此方式封装以方便使用）
            0xE25B,
            fontFamily: "MaterialIcons",
          ),
          color: Colors.orange,
          size: 48,
        ),
      ],
    );
  }
}