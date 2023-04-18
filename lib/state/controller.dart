/*
 * 状态管理 - 自定义 controller
 *
 * 为自定义组件指定一个自定义 controller 后，就可以在自定义组件的外部通过这个 controller 控制自定义组件或监听自定义组件
 */

import 'package:flutter/material.dart';

class ControllerDemo extends StatefulWidget {
  const ControllerDemo({Key? key}) : super(key: key);

  @override
  _ControllerDemoState createState() => _ControllerDemoState();
}

class _ControllerDemoState extends State<ControllerDemo> {

  final _controller = _MyWidgetController();
  var _color = Colors.transparent;

  @override
  void initState() {

    /// 通过 controller 监听自定义组件的变化
    _controller.addListener(() {
      setState(() {
        _color = _controller.color;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    /// 清理 controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: _MyWidget(
                /// 创建自定义组价，并指定一个自定义 controller
                controller: _controller,
              ),
            ),
            const SizedBox(height: 10),
            Text("color: $_color"),
            const SizedBox(height: 10),
            ElevatedButton(
              /// 通过 controller 启动自定义组件中的动画
              onPressed: () => _controller.startAnimation(),
              child: const Text('启动'),
            )
          ],
        ),
      ),
    );
  }
}

/// 通过继承 ChangeNotifier 实现一个自定义 controller
class _MyWidgetController extends ChangeNotifier {

  Color color = Colors.transparent;
  bool shouldStartAnimation = false;

  void setColor(Color color) {
    this.color = color;
    notifyListeners();
  }

  void startAnimation() {
    this.shouldStartAnimation = true;
    notifyListeners();
  }
}

/// 自定义组件，为其指定一个自定义 controller 后，就可以在这个自定义组件的外部，通过这个 controller 控制自定义组件或监听自定义组件
/// 本例可以通过 controller 控制这个组件的动画的启动，以及监听这个动画的变化
class _MyWidget extends StatefulWidget {
  const _MyWidget({required this.controller, Key? key}) : super(key: key);
  final _MyWidgetController controller;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_MyWidget> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {

    _animationController = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(_animationController)
      ..addListener(() {
        /// 动画发生变化时告知 controller，然后在组件的外部就可以通过 controller 监听到这个变化
        widget.controller.setColor(_colorAnimation.value!);
      });

    /// 如果组件的外部通过 controller 启动自定义组件中的动画，则这里就可以监听到这个动作
    widget.controller.addListener(() {
      if (widget.controller.shouldStartAnimation) {
        widget.controller.shouldStartAnimation = false;
        _animationController.reset();
        _animationController.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    /// 清理 controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: _colorAnimation,
      builder: (BuildContext context, Widget? widget) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _colorAnimation.value,
          ),
        );
      },
    );
  }
}