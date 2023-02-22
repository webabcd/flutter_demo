/*
 * TabBar - 选项卡（一般在 Scaffold 中使用）
 *
 * TabBar - 选项卡整体效果（其内的 Tab 用于定义每一个选项卡）
 * TabBarView - 每个选项卡对应的内容
 * TabController - 用于把 TabBar 和 TabBarView 关联起来
 *
 * 关于自定义 TabController 的用法，通过程序切换选项卡，以及如何保持每个 Tab 对应的内容的状态请参见 scaffold_tabBar2.dart
 */

import 'package:flutter/material.dart';

class ScaffoldTabBarDemo extends StatefulWidget {
  const ScaffoldTabBarDemo({Key? key}) : super(key: key);

  @override
  _ScaffoldTabBarDemoState createState() => _ScaffoldTabBarDemoState();
}

class _ScaffoldTabBarDemoState extends State<ScaffoldTabBarDemo> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(                            /// 默认 TabController（如果需要自己定义 TabController 的逻辑请参见 scaffold_tabBar2.dart）
      length: 2,                                            /// Tab 的数量
      initialIndex: 0,                                      /// 默认选中的 Tab 的索引位置
      child: Scaffold(                                      /// 通常用 Scaffold，Scaffold 内包含 AppBar，AppBar 内包含 TabBar
        body: const TabBarView(                             /// 指定 TabBarView，其用于定义每个选项卡对应的内容
          children: [
            Text('left page'),
            Text('right page'),
          ],
        ),
        appBar: AppBar(
          toolbarHeight: 40,
          title: const Text('title'),
          centerTitle: true,
          /// PreferredSize 一般用于 AppBar 或 AppBar 的 bottom，其中 AppBar 已经实现了 PreferredSizeWidget
          bottom: PreferredSize(
            /// 经测试，
            /// 1、Tab.height 用于指定 Tab 的高度（其不包含 TabBar.indicatorWeight）
            /// 2、TabBar.indicatorWeight 用于指定 TabBar 的 indicatorWeight 的高度（当不使用自定义 indicator 时有效）
            /// 3、PreferredSize.preferredSize 用于指定 AppBar.bottom 的高度，其必须 >= Tab.height + TabBar.indicatorWeight
            /// 4、toolbar 和 tabbar 中间的空隙的高度为 PreferredSize.preferredSize - height - TabBar.indicatorWeight
            preferredSize: Size.fromHeight(44),
            child: ColoredBox(
              color: Colors.black,                          /// 用于定义选项卡栏的背景
              child: TabBar(                                /// TabBar，用于定义选项卡
                labelColor: Colors.white,                   /// 选中时，选项卡的文字或图标的颜色
                labelStyle: TextStyle(),                    /// 选中时，选项卡的文本样式
                unselectedLabelColor: Colors.grey,          /// 未选中时，选项卡的文字或图标的颜色
                unselectedLabelStyle: TextStyle(),          /// 未选中时，选项卡的文本样式

                indicatorColor: Colors.red,                 /// 选项卡下面指针的颜色
                indicatorSize: TabBarIndicatorSize.tab,     /// 选项卡下面指针的宽度
                                                            ///   TabBarIndicatorSize.tab - 和选项卡本身一样宽
                                                            ///   TabBarIndicatorSize.label - 和选项卡上的文字一样宽
                indicatorWeight: 4,                         /// 选项卡下面指针的高度
                indicatorPadding: EdgeInsets.zero,          /// 选项卡下面指针的边距

                /*
                indicator: BoxDecoration(                   /// 用于自定义选项卡指针，设置此属性后上面那些 indicatorXxx 就都无效了
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green
                ),
                */

                padding: EdgeInsets.zero,                   /// 选项卡的边距
                isScrollable: false,                        /// 选项卡过多而显示不下时，是否允许左右滚动
                enableFeedback: true,                       /// 切换选项卡时是否允许力反馈（震动）

                tabs: [                                     /// Tab 对象集合
                  Tab(                                      /// 用于定义每一个选项卡
                    icon: Icon(Icons.home),                 /// 图标
                    iconMargin: EdgeInsets.zero,            /// 图标边距
                    text: "home",                           /// 文字
                    height: 40,                             /// 高度
                    child: null,                            /// 用于自定义 Tab
                  ),
                  Tab(
                      icon: Icon(Icons.message)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}