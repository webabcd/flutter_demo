/*
 * Hero - 一个对象从一个页飞入另一个页的动画
 *
 * 在不同页之间做动画切换的时候，一个对象可以在其中无缝动画过渡（实际上每个页持有的是这个对象的不同的实例）
 *
 * Hero - 指的是上面所说的，可以在不同页切换的时候做无缝动画过渡的对象
 *   tag - 这个是 Hero 的标识，用于将不同页的不同 Hero 实例标记为相关对象
 *   createRectTween - 用于定义 Hero 的起点到终点之间的动画效果
 */

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroDemo extends StatelessWidget {
  const HeroDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyPage1();
  }
}

class MyPage1 extends StatelessWidget {
  const MyPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      backgroundColor: Colors.red,
      body: WillPopScope(
        child: const Center(
          child: MyImage(
            /// 图片地址，本例中也用它做 Hero 的标识，这样就把 MyPage1 的 MyImage() 中的 Hero 对象和 MyPage2 中的 MyImage() 中的 Hero 关联起来了
            imageUrl: 'assets/son.jpg',
            imageWidth: 300.0,
          ),
        ),
        onWillPop: () {
          /// 用于设置全局动画的放慢倍数
          timeDilation = 1.0;
          return Future.value(true);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 用于设置全局动画的放慢倍数（这里设置为慢 5 倍，以便观察动画效果）
          timeDilation = 5.0;

          /// 页面切换时会触发 2 个页面之间的同 tag 的 Hero 对象的动画，看起来就是一个对象在做动画
          Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
            return const MyPage2();
          }));
        },
        child: const Icon(Icons.animation),
      ),
    );
  }
}

class MyPage2 extends StatelessWidget {
  const MyPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      backgroundColor: Colors.green,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: const MyImage(
          /// 图片地址，本例中也用它做 Hero 的标识，这样就把 MyPage2 的 MyImage() 中的 Hero 对象和 MyPage1 中的 MyImage() 中的 Hero 关联起来了
          imageUrl: 'assets/son.jpg',
          imageWidth: 100.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 页面切换时会触发 2 个页面之间的同 tag 的 Hero 对象的动画，看起来就是一个对象在做动画
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.animation),
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({super.key, required this.imageUrl, required this.imageWidth,});

  final String imageUrl;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      child: Hero(
        tag: imageUrl,
        createRectTween: (begin, end) {
          /// begin 和 end 分别是 Hero 动画的起点和终点的 rect
          /// 下面这个就是 Hero 的 RectTween 的默认实现（如果需要使用自己的动画效果，可以通过继承 Tween<Rect?> 实现自己的逻辑）
          return MaterialRectCenterArcTween(begin: begin, end: end);
        },
        child: Image.asset(imageUrl, fit: BoxFit.contain,),
      ),
    );
  }
}
