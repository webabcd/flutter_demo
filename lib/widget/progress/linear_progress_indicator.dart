/*
 * LinearProgressIndicator - 条形进度条
 */

import 'package:flutter/material.dart';

class LinearProgressIndicatorDemo extends StatefulWidget {
  const LinearProgressIndicatorDemo({Key? key}) : super(key: key);

  @override
  _LinearProgressIndicatorDemoState createState() => _LinearProgressIndicatorDemoState();
}

class _LinearProgressIndicatorDemoState extends State<LinearProgressIndicatorDemo> with SingleTickerProviderStateMixin {

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LinearProgressIndicator(
            /// 进度条前景色，如果前景色不需要变化的话，则可以通过 AlwaysStoppedAnimation() 指定
            valueColor: AlwaysStoppedAnimation(Colors.red),
            /// 进度条背景色
            backgroundColor: Colors.blue,
          ),
          const LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
            backgroundColor: Colors.blue,
            /// 当前的进度值（0 - 1 之间），如果此值设置为 null 则显示为循环动画
            value: 0.3,
            /// 进度条的高度
            minHeight: 10,
          ),
          /// 可以通过 SizedBox 指定 LinearProgressIndicator 的尺寸
          const SizedBox(
            height: 30,
            width: 200,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
              backgroundColor: Colors.blue,
              value: 0.3,
            ),
          ),
          const SizedBox(
            height: 30,
            width: 200,
            /// 可以通过 ClipRRect 实现圆角的条形进度条
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
                backgroundColor: Colors.blue,
                value: 0.3,
              ),
            ),
          ),
          /// 进度条前景色是一个 Animation<Color?> 对象，所以可以为前景色自定义动画效果
          LinearProgressIndicator(
            valueColor: ColorTween(begin: Colors.red, end: Colors.green).animate(_animationController),
            backgroundColor: Colors.blue,
            value: _animationController.value,
          ),
        ],
      ),
    );
  }
}