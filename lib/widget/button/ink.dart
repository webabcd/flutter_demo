/*
 * Ink/InkWell/InkResponse - 让任意组件支持点击事件和点击效果
 *
 * InkWell/InkResponse 用于让任意组件支持点击事件和点击效果
 * InkWell 通过继承 InkResponse 的方式实现了对 InkResponse 的二次封装，从而简化了一些设置
 * Ink 用于在 InkWell/InkResponse 外包装一层，从而定义 InkWell/InkResponse 在普通状态时的样式
 *
 * 注：如果不需要点击效果，那么用 GestureDetector 即可，参见 /input/gesture_detector.dart
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class InkDemo extends StatelessWidget {
  const InkDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// InkWell - 让任意组件支持点击事件和点击效果
            InkWell(
              /// 点击时，水波纹效果扩散到最大时的半径
              radius: 100,
              /// 点击时，水波纹效果的颜色
              splashColor: Colors.red,
              /// 点击时，背景效果的形状
              borderRadius: BorderRadius.circular(25),
              /// 点击事件
              onTap: () {
                log('onTap');
              },
              /// 双击事件
              onDoubleTap: () {
                log('onDoubleTap');
              },
              /// 长按事件
              onLongPress: () {
                log('onDoubleTap');
              },
              /// 按下
              onTapDown: (details) {
                /// globalPosition - 相对于屏幕的位置
                /// localPosition - 相对于父的位置
                log('onTapDown: ${details.globalPosition}, ${details.localPosition}');
              },
              /// 抬起
              onTapUp: (details) {
                log('onTapUp: ${details.globalPosition}, ${details.localPosition}');
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: const MyText("InkWell"),
              ),
            ),

            /// InkWell - 让任意组件支持点击事件和点击效果
            InkWell(
              /// 点击时，背景效果的形状
              borderRadius: BorderRadius.circular(25),
              /// 点击时，背景效果的颜色
              highlightColor: Colors.blue,
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: const MyText("InkWell"),
              ),
              onTap: () {
                log('onTap');
              },
            ),

            /// InkWell - 让任意组件支持点击事件和点击效果
            /// Ink - 在 InkWell 外面包一层 Ink 用于定义普通状态时的样式
            Ink(
              padding: EdgeInsets.zero,
              width: 240,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(
                /// 点击时，背景效果的形状
                borderRadius: BorderRadius.circular(10),
                /// 点击时，背景效果的颜色
                highlightColor: Colors.blue,
                child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: const MyText("Ink/InkWell"),
                ),
                onTap: () {
                  log('onTap');
                },
              ),
            ),

            /// InkResponse - 让任意组件支持点击事件和点击效果
            /// Ink - 在 InkResponse 外面包一层 Ink 用于定义普通状态时的样式
            Ink(
              padding: EdgeInsets.zero,
              width: 240,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkResponse(
                /// 是否需要按需剪裁水波纹
                containedInkWell: true,
                /// 点击时，背景效果的形状
                borderRadius: BorderRadius.circular(10),
                /// 点击时，背景效果的形状（rectangle 或 circle）
                highlightShape: BoxShape.rectangle,
                /// 点击时，背景效果的颜色
                highlightColor: Colors.blue,
                child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: const MyText("Ink/InkResponse"),
                ),
                onTap: () {
                  log('onTap');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}