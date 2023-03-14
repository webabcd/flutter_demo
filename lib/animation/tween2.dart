/*
 * Tween - 补间动画（曲线型动画）
 *
 * CurvedAnimation 继承自 Animation<double>，其可以支持曲线型动画（缓动动画）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class Tween2Demo extends StatefulWidget {
  const Tween2Demo({Key? key}) : super(key: key);

  @override
  _Tween2DemoState createState() => _Tween2DemoState();
}

class _Tween2DemoState extends State<Tween2Demo> with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3),);

    /// 实例化 CurvedAnimation（曲线型动画）
    ///   parent - 关联的 Animation<double> 对象，这个 Animation<double> 的 double 的范围必须在 0.0 到 1.0 之间
    ///   curve - 缓动类型
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    /// 通过 Tween<T> 的构造函数指定需要做补间动画的类型为 double 类型，范围是 100 到 300 之间
    /// 通过 animate() 将指定的 Animation<double> 对象（0.0 - 1.0 之间）转换为需要的 Animation<double> 对象（100.0 - 300.0 之间）
    _animation = Tween<double>(begin: 100, end: 300).animate(curvedAnimation)
      ..addListener(() {
        log("value: ${_animation.value}");
        setState(() {

        });
      });

    /// 注：tween.animate(animation) 和 animation.drive(tween) 是一样，比如下面两句的结果是一样的
    // _animation = Tween<double>(begin: 100, end: 300).animate(curvedAnimation);
    // _animation = curvedAnimation.drive(Tween<double>(begin: 100, end: 300));
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
