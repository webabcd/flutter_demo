/*

 */

import 'package:flutter/material.dart';

class UnconstrainedBoxDemo extends StatelessWidget {
  const UnconstrainedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}