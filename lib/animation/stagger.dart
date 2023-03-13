/*
 * Stagger - 复合动画，即一个 AnimationController 控制多个动画
 *
 * 通过 Interval 定义 CurvedAnimation 的 curve
 * 其用于指定 CurvedAnimation 相对于 AnimationController 的开始点和结束点
 */

import 'package:flutter/material.dart';

class StaggerDemo extends StatefulWidget {
  const StaggerDemo({super.key});

  @override
  State<StaggerDemo> createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 10000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          width: 300.0,
          height: 300.0,
          child: StaggerAnimation(controller: _controller),
        ),
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


/// 用于演示复合动画，即一个 AnimationController 控制多个动画
class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.controller})
      :
  opacity = Tween<double>(begin: 0.0, end: 1.0,).animate(CurvedAnimation(parent: controller,
    curve: const Interval(0.0, 0.100, curve: Curves.bounceInOut,),
  ),),

  width = Tween<double>(begin: 50.0, end: 150.0,).animate(CurvedAnimation(parent: controller,
    /// Interval 用于指定动画相对于 AnimationController 的开始点和结束点
    ///   因为 AnimationController 指定了动画为 10 秒
    ///   所以此动画会开始在 0.125 * 10 = 1.25 秒，结束在 0.250 * 10 = 2.5 秒
    curve: const Interval(0.125, 0.250, curve: Curves.bounceInOut,),
  ),),

  height = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(parent: controller,
    curve: const Interval(0.250, 0.375, curve: Curves.bounceInOut,),
  ),),

  padding = EdgeInsetsTween(begin: const EdgeInsets.only(bottom: 16.0), end: const EdgeInsets.only(bottom: 75.0),).animate(CurvedAnimation(parent: controller,
    curve: const Interval(0.250, 0.375, curve: Curves.bounceInOut,),
  ),),

  borderRadius = BorderRadiusTween(begin: BorderRadius.circular(4.0), end: BorderRadius.circular(75.0),).animate(CurvedAnimation(parent: controller,
    curve: const Interval(0.375, 0.500, curve: Curves.bounceInOut,),
  ),),

  color = ColorTween(begin: Colors.red, end: Colors.green,).animate(CurvedAnimation(parent: controller,
    curve: const Interval(0.500, 0.750, curve: Curves.bounceInOut,),
  ),);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(
              color: Colors.blue,
              width: 3.0,
            ),
            borderRadius: borderRadius.value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}