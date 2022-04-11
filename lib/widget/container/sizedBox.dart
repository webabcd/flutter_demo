/*

 */

import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget {
  const SizedBoxDemo({Key? key}) : super(key: key);

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