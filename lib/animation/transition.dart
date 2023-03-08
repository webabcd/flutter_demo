/*
 * Transition - 支持直接关联 Animation<T> 并自动重绘的 Widget（FadeTransition, SizeTransition, SlideTransition 等）
 *
 * 在经典的动画实现中，Animation<T> 每次更新后，需要我们手动触发 Widget 重绘，然后用 Animation<T> 中的 T 的值更新 Widget 中对应的内容
 * 有一些 Widget 可以直接关联 Animation<T> 并自动重绘
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class TransitionDemo extends StatefulWidget {
  const TransitionDemo({Key? key}) : super(key: key);

  @override
  _TransitionDemoState createState() => _TransitionDemoState();
}

class _TransitionDemoState extends State<TransitionDemo> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<double> _animationDouble = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  );

  late final Animation<Offset> _animationOffset = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.5, 1.0),
  ).animate(_animationDouble);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        children: [
          Flexible(
            child: Center(
              /// FadeTransition - 不透明度动画
              child: FadeTransition(
                /// 指定一个 Animation<double> 对象，用于做不透明度动画
                opacity: _animationDouble,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 50,
                ),
              ),
            ),
          ),
          Flexible(
            child: Center(
              /// SizeTransition - 尺寸动画
              child: SizeTransition(
                /// 指定一个 Animation<double> 对象，用于对宽或高做动画
                sizeFactor: _animationDouble,
                /// Axis.horizontal - 对宽做动画
                /// Axis.vertical - 对高做动画
                axis: Axis.horizontal,
                /// -1.0 到 1.0 之间
                /// 当 Axis.horizontal 且尺寸变大时， -1 代表从左到右变大，0 代表从中间到左右变大，1 代表从右到左变大
                /// 当 Axis.vertical 且尺寸变大时， -1 代表从上到下变大，0 代表从中间到上下变大，1 代表从下到上变大
                axisAlignment: 1,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 50,
                  child: const MyText("SizeTransition"),
                ),
              ),
            ),
          ),
          Flexible(
            child: Center(
              /// SlideTransition - 偏移动画
              child: SlideTransition(
                /// 指定一个 Animation<Offset> 对象，用于做偏移动画
                /// x 轴偏移量为 width * Offset.dx
                /// y 轴偏移量为 height * Offset.dy
                position: _animationOffset,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 50,
                ),
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
