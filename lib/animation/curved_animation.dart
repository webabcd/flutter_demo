/*
 * CurvedAnimation - 曲线型动画（缓动动画）
 *
 * CurvedAnimation 继承自 Animation<double>，其可以支持曲线型动画（缓动动画）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class CurvedAnimationDemo extends StatefulWidget {
  const CurvedAnimationDemo({Key? key}) : super(key: key);

  @override
  _CurvedAnimationDemoState createState() => _CurvedAnimationDemoState();
}

class _CurvedAnimationDemoState extends State<CurvedAnimationDemo> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3),)
      ..addListener(() {
        log("value: ${_controller.value}");
        setState(() {

        });
      });

    /// 实例化 CurvedAnimation（曲线型动画）
    ///   parent - 关联的 Animation<double> 对象，这个 Animation<double> 的 double 的范围必须在 0.0 到 1.0 之间
    ///   curve - 缓动类型（如果需要直线型动画就用 Curves.linear 即可）
    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
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
                height: _curvedAnimation.value * 300, /// 从 CurvedAnimation 中获取当前的动画值
                width: _curvedAnimation.value * 300,  /// 从 CurvedAnimation 中获取当前的动画值
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
