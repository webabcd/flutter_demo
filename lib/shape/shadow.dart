/*
 * 阴影
 *
 * BoxShadow - 阴影效果
 *   color - 阴影的颜色
 *   offset - 阴影的偏移量
 *   blurRadius - 阴影的延伸半径（有模糊效果）
 *   spreadRadius - 阴影的延伸半径（无模糊效果）
 *   blurStyle - 阴影的模糊效果
 *     BlurStyle.normal - 阴影的内部模糊，外部模糊，默认值
 *     BlurStyle.solid - 阴影的内部不模糊，外部模糊
 *     BlurStyle.outer - 阴影的内部透明，外部模糊
 *     BlurStyle.inner - 阴影的内部模糊，外部透明
 */

import 'package:flutter/material.dart';

class ShadowDemo extends StatefulWidget {
  const ShadowDemo({Key? key}) : super(key: key);

  @override
  _ShadowDemoState createState() => _ShadowDemoState();
}

class _ShadowDemoState extends State<ShadowDemo> {
  var _blurStyle = BlurStyle.normal;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 200,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.red,
            /// 周围均有阴影，且阴影模糊
            /// 注：BoxDecoration 的 boxShadow 属性是一个列表，可以叠加多种阴影效果
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                blurRadius: 10,
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.red,
            /// 周围均有阴影，且阴影不模糊
            /// 注：BoxDecoration 的 boxShadow 属性是一个列表，可以叠加多种阴影效果
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                spreadRadius : 10,
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.red,
            /// 阴影往右下角偏移，且阴影模糊
            /// 注：BoxDecoration 的 boxShadow 属性是一个列表，可以叠加多种阴影效果
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                blurRadius: 10,
                offset: Offset(5, 5),
              ),
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              /// 本例用于演示阴影的各种模糊效果
              /// 注：BoxDecoration 的 boxShadow 属性是一个列表，可以叠加多种阴影效果
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 20,
                  offset: Offset(10, 10),
                  blurStyle: _blurStyle
                ),
              ],
            ),
            child: Text(
              "$_blurStyle",
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                decoration: TextDecoration.none
              ),
            ),
          ),
          onTap: () {
            setState(() {
              var index = _blurStyle.index + 1;
              if (index >= BlurStyle.values.length) {
                index = 0;
              }
              _blurStyle = BlurStyle.values[index];
            });
          },
        ),
      ],
    );
  }
}