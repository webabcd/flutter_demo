/*
 * PageView - 页面滚动切换
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {

  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      /// 关联的 PageView 的初始页的索引位置
      initialPage: 0,
      /// 是否需要保持 PageView 中的每个元素的状态
      keepPage: true,
      /// PageView 中的每个元素占用的页空间的比例
      viewportFraction: 1.0,
    );

    /// 通过 controller 监听 PageView 的变化
    _pageController.addListener(() {
      /// 滚动的距离
      double offset = _pageController.offset;
      /// 索引位置（比如 1.5 代表第 3 个元素显示了一半）
      double? index = _pageController.page;
      log("offset:$offset, index:$index");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 200,
            /// 可以通过 PageView() 的 children 一个一个地指定 PageView 中的每个元素（初始化的时就会把所有元素都创建好）
            /// 也可以通过 PageView.builder() 动态生成 PageView 中的每个元素（按需创建）
            child: PageView.builder(
              /// 显示的索引位置发生变化时的回调
              onPageChanged: (int index) {
                log("onPageChanged:$index");
                _currentPageIndex = index;
              },
              /// 滚动到边缘时的物理效果
              physics: const BouncingScrollPhysics(),
              /// 滚动方向（horizontal 或 vertical）
              scrollDirection: Axis.horizontal,
              /// 关联的 PageController
              controller: _pageController,
              /// 用于指定 PageView 中的元素数量
              itemCount: 10,
              /// 用于构造 PageView 中的每个元素
              itemBuilder: (BuildContext context, int index) {
                log("itemBuilder:$index");
                return Image.asset(
                  "assets/son.jpg",
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          MyButton(
            child: const Text("滚动到下一页"),
            onPressed: () {
              /// animateToPage() - 有动画的方式跳转到指定的页
              /// animateTo() - 有动画的方式跳转到指定的距离
              /// jumpToPage() - 无动画的方式跳转到指定的页
              /// jumpTo() - 无动画的方式跳转到指定的距离
              _pageController.animateToPage(
                _currentPageIndex + 1,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
        ],
      ),
    );
  }
}