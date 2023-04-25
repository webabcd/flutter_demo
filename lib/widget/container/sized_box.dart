/*
 * SizedBox - 确定宽高（SizedBox 会告诉其子元素宽和高是多少）
 *   width - 宽，设置为 double.infinity 代表尽量宽
 *   height - 高，设置为 double.infinity 代表尽量高
 */

import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget {
  const SizedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 200,
          height: 100,
          /// SizedBox 设置了宽和高，则其子元素的宽和高会强制与 SizedBox 的宽和高相同
          /// 结果 Container 的宽为 200，高为 100
          child: Container(
            width: 1,
            height: 1,
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 200,
          /// SizedBox 如果没设置宽或高，则其子元素自行确定宽或高
          /// 结果 Container 的宽为 200，高为 30
          child: Container(
            width: 1,
            height: 30,
            color: Colors.green,
          ),
        ),

        SizedBox(
          width: 200,
          height: 200,
          /// SizedBox.expand() 是一个宽和高都是 double.infinity 的 SizedBox
          child: SizedBox.expand(
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}