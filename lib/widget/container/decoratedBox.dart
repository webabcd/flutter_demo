/*
 * DecoratedBox - 装饰（用于绘制背景，边框，渐变，阴影，矩形或圆形等效果）
 *   position - 装饰效果的绘制位置
 *     DecorationPosition.background - 在 DecoratedBox 的 child 的后面绘制，不会挡住 child，默认值
 *     DecorationPosition.foreground - 在 DecoratedBox 的 child 的前面绘制，会挡住 child
 *   decoration - 详细的装饰信息，一个 BoxDecoration 类型的对象
 *     gradient - 渐变色，参见 /lib/shape/gradient.dart
 *     border - 边框，需要指定一个 BoxBorder 类型的对象，一般就是指定一个 Border 对象，因为 Border 继承自 BoxBorder
 *       其他各种类型的边框的使用请参见 /lib/shape/border.dart
 *     borderRadius - 边框半径
 *     boxShadow - 阴影，参见 /lib/shape/shadow.dart
 *     color - 背景颜色
 *     image - 背景图片
 *     shape - 剪裁形状
 *       BoxShape.rectangle - 矩形剪裁，默认值
 *       BoxShape.circle - 圆形剪裁
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class DecoratedBoxDemo extends StatelessWidget {
  const DecoratedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// 在 DecoratedBox 的 child 的后面绘制一个渐变背景，边框，阴影
        DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors:[Colors.red, Colors.green]),
            border: Border.all(color: Colors.orange, width: 5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.blue,
                  offset: Offset(5, 5),
                  blurRadius: 5
              ),
            ],
          ),
          child: Container(
            width: 200,
            height: 50,
            alignment: Alignment.center,
            child: MyText("webabcd"),
          ),
        ),
        /// 在 DecoratedBox 的 child 的后面绘制一个纯色背景，并做圆形剪裁
        DecoratedBox(
          position: DecorationPosition.background,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: MyText("abc"),
          ),
        ),
        /// 在 DecoratedBox 的 child 的后面绘制一个图片背景，并做圆形剪裁
        DecoratedBox(
          position: DecorationPosition.background,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/son.jpg"),
              fit: BoxFit.cover
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: MyText("abc"),
          ),
        ),
      ],
    );
  }
}