/*
 * 通过组合多个 Widget 的方式实现自定义组件
 */

import 'dart:math';

import 'package:flutter/material.dart';

import '../../helper.dart';

class CustomWidgetDemo extends StatefulWidget {
  const CustomWidgetDemo({Key? key}) : super(key: key);

  @override
  _CustomWidgetDemoState createState() => _CustomWidgetDemoState();
}

class _CustomWidgetDemoState extends State<CustomWidgetDemo> {

  double _angle = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          /// 通过继承已有 Widget 的方式实现自定义 Widget
          const _MyText("_MyText"),

          /// 通过继承 StatelessWidget 的方式实现自定义的无状态组件
          _GradientButton(
            colors: const [Colors.red, Colors.green],
            borderRadius: BorderRadius.circular(10),
            width: 300,
            height: 50,
            child: const Text("_GradientButton"),
            onPressed: () {
              setState(() {
                _angle += pi / 2;
              });
            },
          ),

          /// 通过继承 StatefulWidget 的方式实现自定义的有状态组件
          _RotationAnimationBox(
            angle: _angle,
            duration: 500,
            child: const MyText("_RotationAnimationBox"),
          ),
        ],
      ),
    );
  }
}

/// 通过继承已有 Widget 的方式实现自定义 Widget
/// 下面的示例用于实现一个自定义的 Text 组件，其默认文字大小 24，颜色白色，无下划线
class _MyText extends Text {
  const _MyText(super.data) : super(
    style: const TextStyle(
      fontSize: 24.0,
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
  );
}

/// 通过继承 StatelessWidget 的方式实现自定义的无状态组件
/// 下面的示例用于实现一个支持渐变背景色的按钮组件
class _GradientButton extends StatelessWidget {
  const _GradientButton({
    this.colors,        /// 渐变色
    this.borderRadius,
    this.width,
    this.height,
    required this.onPressed,
    required this.child,
  });
  final List<Color>? colors;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final GestureTapCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 通过继承 StatefulWidget 的方式实现自定义的有状态组件
/// 下面的示例用于实现一个支持旋转动画的组件
class _RotationAnimationBox extends StatefulWidget {
  const _RotationAnimationBox({
    this.angle = .0,      /// 目标旋转弧度
    this.duration = 200,  /// 从当前弧度旋转到目标旋转弧度的动画时长
    required this.child
  });
  final double angle;
  final int duration;
  final Widget child;

  @override
  _RotationAnimationBoxState createState() => _RotationAnimationBoxState();
}
class _RotationAnimationBoxState extends State<_RotationAnimationBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.angle;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      /// turns 的意思是旋转的圈数，也就是说 turns = angle / (2 * pi)
      turns: _controller,
      child: widget.child,
    );
  }

  /// 当父组件重绘时
  @override
  void didUpdateWidget(_RotationAnimationBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// 如果 _RotationAnimationBox 的 angle 发生变化了则启动动画
    if (oldWidget.angle != widget.angle) {
      /// _controller 会从当前值动画到 widget.angle / (2 * pi)
      _controller.animateTo(widget.angle / (2 * pi), duration: Duration(milliseconds: widget.duration), curve: Curves.ease);
    }
  }
}