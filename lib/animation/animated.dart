/*
 * AnimatedXxx - 极简动画 Widget（AnimatedContainer, AnimatedDefaultTextStyle, AnimatedOpacity, AnimatedPadding, AnimatedPositioned, AnimatedRotation，AnimatedScale， AnimatedSize， AnimatedSlide 等）
 *
 * 通过 AnimatedXxx 系列 Widget 可以非常简单的实现动画，不需要自己写管理 Animation<T> 的代码
 * AnimatedXxx 继承自 ImplicitlyAnimatedWidget（隐式动画）
 *
 * 本例以 AnimatedContainer 为例，其他的使用方式都是差不多的
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class AnimatedDemo extends StatefulWidget {
  const AnimatedDemo({Key? key}) : super(key: key);

  @override
  _AnimatedDemoState createState() => _AnimatedDemoState();
}

class _AnimatedDemoState extends State<AnimatedDemo> {

  bool _selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        /// AnimatedContainer - 对 Container 的各种属性做动画
        ///   AnimatedContainer 第一次构造时不会有动画，后续再构造时会以动画的方式将就值过渡到新值
        child: AnimatedContainer(
          width: _selected ? 200.0 : 100.0,
          height: _selected ? 100.0 : 200.0,
          color: _selected ? Colors.red : Colors.green,
          alignment: _selected ? Alignment.center : Alignment.topRight,

          duration: const Duration(seconds: 2), /// 动画时长
          curve: Curves.bounceInOut,            /// 动画的缓动方式（如果需要直线型动画就用 Curves.linear 即可）
          child: const MyText("Text"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}