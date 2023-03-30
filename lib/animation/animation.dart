/*
 * Animation - 动画基础（以直线型动画为例）
 *
 * Animation<T> 用于将 T 动画化，它知道动画的状态，以及 T 的值，但是与 UI 无关
 * AnimationController 继承自 Animation<double>，其增加了一些管理 Animation<double> 的功能
 *   默认会在 0.0 到 1.0 之间做动画（直线型）
 *   可以操作动画，比如前进，倒退，重复，停止等
 *
 * 注：在 flutter 中玩动画，AnimationController 是必不可少的
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  String message = "";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      /// vsync 用于防止动画不在当前屏幕显示时消耗不必要的资源，需要 with SingleTickerProviderStateMixin
      ///   他会将动画定时器绑定到 Widget，当 Widget 不显示时，动画定时器就会暂停，当 Widget 显示时，动画定时器就会恢复
      vsync: this,
      /// 正向动画的时长
      duration: const Duration(seconds: 3),
      /// 反向动画的时长
      reverseDuration: const Duration(seconds: 1),
      /// 动画 double 的最小值（默认 0.0）
      lowerBound: 0.0,
      /// 动画 double 的最大值（默认 1.0）
      upperBound: 300.0
    )
      /// 动画值发生变化时触发的事件
      ..addListener(() {
        /// 获取当前的动画值
        log("value: ${_controller.value}");
        /// 重绘 Widget 从而在 UI 上实现动画
        setState(() {
          /// 获取当前的动画状态和动画值
          message = "isAnimating:${_controller.isAnimating}\n"
              "isCompleted:${_controller.isCompleted}\n"
              "isDismissed：${_controller.isDismissed}\n"
              "status:${_controller.status}\n"
              "value:${_controller.value}";
        });
      })
      /// 动画状态发生变化时触发的事件
      ..addStatusListener((status) {
        /// AnimationStatus.forward - 正向动画进行中
        /// AnimationStatus.reverse - 反向动画进行中
        /// AnimationStatus.completed - 正向动画完成
        /// AnimationStatus.dismissed - 反向动画完成（动画的元素回到了起始位置）
        log("status: $status");
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
                height: _controller.value,  /// 从 Animation<T> 中获取当前的动画值
                width: _controller.value,   /// 从 Animation<T> 中获取当前的动画值
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
                  child: const Text('forward'),
                  onPressed: () {
                    /// 启动正向动画（动画的时长就是 AnimationController 中的 duration 的值）
                    /// 注：forward(), reverse(), repeat() 返回的是一个 TickerFuture 对象
                    var tickerFuture = _controller.forward();
                  },
                ),
                ElevatedButton(
                  child: const Text('reverse'),
                  onPressed: () {
                    /// 启动反向动画（动画的时长就是 AnimationController 中的 reverseDuration 的值）
                    _controller.reverse();
                  },
                ),
                ElevatedButton(
                  child: const Text('repeat'),
                  onPressed: () {
                    /// 启动循环动画（其中的正向动画部分和反向动画部分的时长均是 AnimationController 中的 duration 的值）
                    _controller.repeat(reverse: true);
                  },
                ),
                ElevatedButton(
                  child: const Text('reset'),
                  onPressed: () {
                    /// 复位
                    _controller.reset();
                  },
                ),
                ElevatedButton(
                  child: const Text('stop'),
                  onPressed: () {
                    /// 停止动画
                    _controller.stop();
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
