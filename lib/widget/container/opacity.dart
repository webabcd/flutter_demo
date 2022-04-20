/*
 * Opacity - 不透明度
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class OpacityDemo extends StatelessWidget {
  const OpacityDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Opacity(
        /// opacity - 不透明度（0 - 1 之间）
        opacity: 0.3,
        child: MyText("webabcd"),
      ),
    );
  }
}