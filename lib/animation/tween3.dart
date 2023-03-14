/*
 * 自定义 Tween - ColorTween, CurveTween, SizeTween, RectTween, AlignmentTween, BorderTween, BoxConstraintsTween, DecorationTween, EdgeInsetsTween, TextStyleTween, IntTween 等
 *
 * 本例以 ColorTween 为例，其他的用法都差不多
 *
 * 当你想对 Color 做动画的时候，会发现直接用 Tween<Color> 是不行的，需要使用 ColorTween（其他的也类似，比如你要对 Rect 做动画就用 RectTween）
 * 像类似 ColorTween 这样的自定义 Tween 是如何实现的呢？其实就是重写 Tween<T> 的 lerp() 方法，自己看源码就能了解了
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class Tween3Demo extends StatefulWidget {
  const Tween3Demo({Key? key}) : super(key: key);

  @override
  _Tween3DemoState createState() => _Tween3DemoState();
}

class _Tween3DemoState extends State<Tween3Demo> with SingleTickerProviderStateMixin {

  late Animation<Color?> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3),);

    /// 通过 ColorTween 实现在指定的颜色之间做动画
    /// 注：通过 .chain(CurveTween) 可以为动画关联一个缓动类型
    _animation = ColorTween(begin: Colors.red, end: Colors.green).chain(CurveTween(curve: Curves.bounceInOut)).animate(_controller)
      ..addListener(() {
        log("value: ${_animation.value}");
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        children: [
          Flexible(
            child: Center(
              child: Container(
                color: _animation.value,
                height: 300,
                width: 300,
              ),
            ),
          ),
          Container(
            height: 40,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('repeat'),
                  onPressed: () {
                    _controller.repeat(reverse: true);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    /// 清理 AnimationController
    _controller.dispose();
    super.dispose();
  }
}
