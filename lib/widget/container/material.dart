/*
 * Material - Material 组件
 *
 * Material 组件就是符合 Material Design 的一套组件，比如 Scaffold, TextButton 等
 * 而 Material 就是最简单的 Material 组件
 */

import 'package:flutter/material.dart';

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 因为 IconButton 之类的必须放到一个 Material 组件内，否则会报错
    /// 可以用 Scaffold 之类的，也可以用最轻量级的 Material
    return Material(
      /// 颜色
      color: Colors.orange,
      /// 边框
      shape: const OutlineInputBorder(
        borderSide: BorderSide(width: 20, color: Colors.green),
      ),
      /// 子
      child: IconButton(
        onPressed: () { },
        icon: const Icon(
          Icons.home,
          size: 72,
          color: Colors.white,
        ),
      ),
    );
  }
}