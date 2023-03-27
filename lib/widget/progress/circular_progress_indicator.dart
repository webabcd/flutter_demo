/*
 * CircularProgressIndicator - 圆形进度条
 */

import 'package:flutter/material.dart';

class CircularProgressIndicatorDemo extends StatefulWidget {
  const CircularProgressIndicatorDemo({Key? key}) : super(key: key);

  @override
  _CircularProgressIndicatorDemoState createState() => _CircularProgressIndicatorDemoState();
}

class _CircularProgressIndicatorDemoState extends State<CircularProgressIndicatorDemo> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              /// 进度条前景色，如果前景色不需要变化的话，则可以通过 AlwaysStoppedAnimation() 指定
              valueColor: AlwaysStoppedAnimation(Colors.red),
              /// 进度条背景色
              backgroundColor: Colors.green,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
              backgroundColor: Colors.green,
              /// 当前的进度值（0 - 1 之间），如果此值设置为 null 则显示为循环动画
              value: 0.25,
            ),
            /// 可以通过 SizedBox 指定 CircularProgressIndicator 的尺寸
            const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
                value: 0.75,
                /// 进度条的宽度
                strokeWidth: 20,
                backgroundColor: Colors.green,
              ),
            ),
            /// 进度条前景色是一个 Animation<Color?> 对象，所以可以为前景色自定义动画效果
            CircularProgressIndicator(
              valueColor: ColorTween(begin: Colors.red, end: Colors.green).animate(_animationController),
              backgroundColor: Colors.blue,
              value: _animationController.value,
            ),
          ],
        ),
      ),
    );
  }
}