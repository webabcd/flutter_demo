/*
 * Tween - 补间动画（直线型动画）
 *
 * Tween<T> 继承自 Animatable<T>
 *   用于在指定的范围对 T 做动画，这个 T 就是你需要动画的类型，可以是 double, Size, Offset, Color 等
 *   通过 animate(Animation<double>) 将指定的 Animation<double> 对象转换为需要的 Animation<T> 对象
 *     比如：
 *     Animation<double> 为 0.0 时 Tween<T> 决定这个 T 是什么值
 *     ...
 *     Animation<double> 为 0.3 时 Tween<T> 决定这个 T 是什么值
 *     ...
 *     Animation<double> 为 1.0 时 Tween<T> 决定这个 T 是什么值
 *
 * 注：
 * 补间动画的意思就是在指定的范围内对指定的数据类型做动画
 * AnimationController 只能对 double 类型做动画，且如果要支持曲线型动画的话，这个 double 还会被限制在 0.0 - 1.0 之间，所以才需要补间动画
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class TweenDemo extends StatefulWidget {
  const TweenDemo({Key? key}) : super(key: key);

  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3),);

    /// 通过 Tween<T> 的构造函数指定需要做补间动画的类型为 double 类型，范围是 0 到 300 之间
    /// 通过 animate() 将指定的 Animation<double> 对象（0.0 - 1.0 之间）转换为需要的 Animation<double> 对象（0.0 - 300.0 之间）
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
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
                color: Colors.blue,
                height: _animation.value,
                width: _animation.value,
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
