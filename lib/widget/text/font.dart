/*
 * 本例用于演示如何使用字体
 *
 * 1、使用系统字体就直接通过设置 TextStyle 的 fontFamily 即可
 * 2、使用第三方字体的步骤：
 *    a) 在 pubspec.yaml 中做类似如下的配置，其用于定义字体名称，以及打包字体文件
 *       # 下面的配置用于演示如何使用第三方字体
 *       fonts:
 *         - family: customfont                   # 字体名称
 *           fonts:
 *             - asset: assets/fonts/myfont.ttf   # 字体文件的地址
 *    b) 使用的时候，用类似如下方式即可
 *       fontFamily: 'myfont',
 */

import 'package:flutter/material.dart';

class FontDemo extends StatelessWidget {
  const FontDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "abcdefghijklmnopqrstuvwxyz",
        style: TextStyle(
          fontFamily: 'customfont',
          fontSize: 48,
          color: Colors.white,
          decoration: TextDecoration.none
        ),
      ),
    );
  }
}