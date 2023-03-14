/*
 * PageRouteBuilder - 路由跳转动画（让 pushNamed() 实现转场动画）
 *
 * 本例用于演示如何通过 Navigator 的 pushNamed() 实现转场动画
 */

import 'package:flutter/material.dart';

import '../helper.dart';

class PageRouteBuilder2Demo extends StatelessWidget {
  const PageRouteBuilder2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const _Page1(),

      /// 通过 onGenerateRoute 处理 pushNamed() 从而实现转场动画
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/page1':
            return _MyPageRouteBuilder(const _Page1());
          case '/page2':
            return _MyPageRouteBuilder(const _Page2());
          case '/page3':
            return _MyPageRouteBuilder(const _Page3());
        }
        return null;
      },
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page 1"),
      ),
      backgroundColor: Colors.red,
      body: MyButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/page2');
        },
        child: const Text('跳转到 page 2'),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page 2"),
      ),
      backgroundColor: Colors.green,
      body: MyButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/page3');
        },
        child: const Text('跳转到 page 3'),
      ),
    );
  }
}

class _Page3 extends StatelessWidget {
  const _Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page 3"),
      ),
      backgroundColor: Colors.blue,
      body: null,
    );
  }
}

/// 封装一个自定义的 PageRouteBuilder（这样可以方便复用）
class _MyPageRouteBuilder extends PageRouteBuilder {

  final Widget widget;

  _MyPageRouteBuilder(this.widget)
      : super(
      transitionDuration: const Duration(milliseconds: 2000),
      reverseTransitionDuration: const Duration(milliseconds: 2000),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          scale: animation.drive(Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease))),
          child: child,
        );
      }
  );
}