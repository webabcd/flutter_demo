/*
 * AnimatedBuilder - 用于简化 AnimatedWidget 动画（不用单独写继承 AnimatedWidget 的类了）
 *
 * AnimatedBuilder 继承自 AnimatedWidget
 */

import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  const AnimatedBuilderDemo({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo> with SingleTickerProviderStateMixin {

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
    return Scaffold(
      appBar: null,
      /// AnimatedBuilder 继承自 AnimatedWidget，其简化了 AnimatedWidget 动画（不用单独写继承 AnimatedWidget 的类了）
      body: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Center(
            child: Container(
              color: Colors.blue,
              height: _animation.value,
              width: _animation.value,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.repeat(reverse: true);
        },
        child: const Icon(Icons.play_arrow),
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