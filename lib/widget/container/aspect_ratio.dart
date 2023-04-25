/*
 * AspectRatio - 宽高比
 */

import 'package:flutter/material.dart';

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          width: double.infinity,
          height: 100.0,
          /// AspectRatio 用于让 child 按照 aspectRatio 指定的宽高比显示
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          width: 100.0,
          height: 100.0,
          /// AspectRatio 用于让 child 按照 aspectRatio 指定的宽高比显示
          child: AspectRatio(
            aspectRatio: 2.0,
            child: Container(
              width: 100.0,
              height: 50.0,
              color: Colors.green,
            ),
          ),
        ),
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          width: 100.0,
          height: 100.0,
          /// AspectRatio 用于让 child 按照 aspectRatio 指定的宽高比显示
          child: AspectRatio(
            aspectRatio: 0.5,
            child: Container(
              width: 100.0,
              height: 50.0,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}