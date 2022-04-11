/*

 */

import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 50, //宽度尽可能⼤
        maxHeight: 50
      ),
      child: Container(
        height: 5.0,
        width: 50,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ),
      ),
    );
  }
}