/*
 * Material - Material 组件
 *
 * Material 组件是符合 Material Design 规范的最简单的组件
 */

import 'package:flutter/material.dart';

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// Material - 最轻量级的符合 Material Design 规范的组件
          Material(
            /// 阴影颜色
            shadowColor: Colors.green,
            /// 阴影大小
            elevation: 10,
            /// 背景颜色
            color: Colors.red,
            /// 边框
            shape: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            /// 子
            child: const Icon(
              Icons.home,
              size: 72,
              color: Colors.white,
            ),
          ),

          const Material(
            /// 圆形的 Material 组件（注：如果设置了 type 为 MaterialType.circle 则必须设置 color）
            type: MaterialType.circle,
            color: Colors.red,
            child: Icon(
              Icons.home,
              size: 72,
              color: Colors.white,
            ),
          ),

          Material(
            /// 背景透明的 Material 组件，可以在其中使用 Ink 相关组件
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () { },
              child: const Icon(
                Icons.home,
                size: 72,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    /// 另外，有一些组件，比如 IconButton 之类的必须放到一个 Material 组件内，否则会报错
    /// 可以用 Scaffold 之类的，也可以用最轻量级的 Material
    return Material(
      child: IconButton(
        onPressed: () { },
        icon: const Icon(
          Icons.home,
          size: 72,
          color: Colors.red,
        ),
      ),
    );
  }
}