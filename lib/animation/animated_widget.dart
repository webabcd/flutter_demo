/*
 * AnimatedWidget - 用于实现自定义的 Transition
 *
 * 在经典的动画实现中，我们需要监听 Animation<T> 的更新，然后手动触发 Widget 重绘，然后用 Animation<T> 中的 T 的值更新 Widget 中对应的内容
 * 自定义 AnimatedWidget 可以直接关联 Animation<T> 并自动重绘，也就是说不用去 addListener() 和 setState() 了
 *
 * 关于原生实现的一些自定义 AnimatedWidget 请参见 transition.dart
 */

import 'package:flutter/material.dart';

class AnimatedWidgetDemo extends StatefulWidget {
  const AnimatedWidgetDemo({Key? key}) : super(key: key);

  @override
  _AnimatedWidgetDemoState createState() => _AnimatedWidgetDemoState();
}

class _AnimatedWidgetDemoState extends State<AnimatedWidgetDemo> with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3),);
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _animation = Tween<double>(begin: 100, end: 300).animate(curvedAnimation);
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.yellow,
                child: _MyTransition(animation: _animation,), /// 使用自定义 AnimatedWidget（这样就不需要 addListener() 和 setState() 了）
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

/// 自定义 AnimatedWidget
class _MyTransition extends AnimatedWidget {
  const _MyTransition({Key?key,required Animation<double> animation}) : super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Container(
        color: Colors.blue,
        height: animation.value,
        width: animation.value,
      ),
    );
  }
}