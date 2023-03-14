/*
 * PageRouteBuilder - 路由跳转动画
 *
 * 本例用于演示如何通过 Navigator 去 push 一个 PageRouteBuilder，从而实现转场动画
 * 如果需要通过 pushNamed() 实现转场动画的话，请参见 page_route_builder2.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class PageRouteBuilderDemo extends StatelessWidget {
  const PageRouteBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _Page1(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              onPressed: () {
                /// 通过 Navigator 可以 push 一个 PageRouteBuilder
                Navigator.of(context).push(
                    PageRouteBuilder(
                        /// 需要跳转到的页面
                        pageBuilder: (context, animation, secondaryAnimation) => const _Page2(),
                        /// 正向动画时长
                        transitionDuration: const Duration(milliseconds: 2000),
                        /// 反向动画时长
                        reverseTransitionDuration: const Duration(milliseconds: 2000),
                        /// 创建一个 Transition 动画
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          /// 以本例为例对 animation 和 secondaryAnimation 做说明：
                          /// 1、当 push 了 _Page2 时，则 _Page2 做 animation 正向动画
                          /// 2、如果当前显示的是 _Page2，当你 pop 了这个 _Page2 时，则这个 _Page2 会做 animation 反向动画
                          /// 3、如果当前显示的是 _Page2，当你 push 了其他页的时候，则这个 _Page2 会做 secondaryAnimation 正向动画
                          /// 4、如果 _Page2 是路由栈中从栈顶开始数的第 2 个路由，则栈顶 pop 后，这个 _Page2 会做 secondaryAnimation 反向动画
                          return SlideTransition(
                            position: Tween<Offset>(begin: const Offset(1.0, 1.0), end: Offset.zero,).chain(CurveTween(curve: Curves.ease)).animate(animation),
                            child: SlideTransition(
                              position: Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, 0.0),).chain(CurveTween(curve: Curves.ease)).animate(secondaryAnimation),
                              child: child,
                            ),
                          );
                        }
                    )
                );
              },
              child: const Text('跳转到 page 2'),
            ),
          ],
        )
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
      body: Center(
        child: MyButton(
          onPressed: () {
            /// 通过继承 PageRouteBuilder 的方式实现路由跳转动画
            Navigator.of(context).push(_MyPageRouteBuilder(const _Page3()));
          },
          child: const Text('跳转到 page 3'),
        ),
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