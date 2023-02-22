/*
 * TabBar - 选项卡（一般在 Scaffold 中使用）
 *
 * 本例用于演示自定义 TabController 的用法，通过程序切换选项卡，以及如何保持每个 Tab 对应的内容的状态
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ScaffoldTabBarDemo2 extends StatefulWidget {
  const ScaffoldTabBarDemo2({Key? key}) : super(key: key);

  @override
  _ScaffoldTabBarDemo2State createState() => _ScaffoldTabBarDemo2State();
}

class _ScaffoldTabBarDemo2State extends State<ScaffoldTabBarDemo2> with TickerProviderStateMixin {

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    /// 实例化 TabController（定义类的时候需要 with TickerProviderStateMixin）
    ///   length - Tab 的数量
    _tabController = TabController(length: 2, vsync: this);

    /// 监听选项卡的切换事件
    /// 手势切换时，切换完成后触发一次事件，TabController 的 indexIsChanging 为 false
    /// 点击切换和程序切换时，切换开始时触发一次事件，indexIsChanging 为 true，切换完成后触发一次事件，indexIsChanging 为 false
    _tabController.addListener(() {
      /// index - 被选中的 Tab 的索引位置
      /// indexIsChanging - 是否正在切换中
      log("selectedIndex:${_tabController.index.toString()}, indexIsChanging:${_tabController.indexIsChanging}");
    });

  }
  @override
  void dispose() {
    /// 清理 TabController
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController.length,
      child: Scaffold(
        body: TabBarView(                         /// 指定 TabBarView 关联的 TabController
          controller: _tabController,
          children: [
            _MyText(),
            _MyText(),
          ],
        ),
        appBar: AppBar(
          title: Text('title'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: ColoredBox(
              color: Colors.black,
              child:  TabBar(
                controller: _tabController,       /// 指定 TabBar 关联的 TabController
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.message)),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward_sharp),
          onPressed: () {
            _selectedIndex += 1;
            if (_selectedIndex > 1)
            {
              _selectedIndex = 0;
            }
            _tabController.animateTo(_selectedIndex);   /// 通过程序切换选项卡
          },
        ),
      ),
    );
  }
}


class _MyText extends StatefulWidget {
  _MyText({Key? key}) : super(key: key);

  @override
  _MyTextState createState() => _MyTextState();
}

/// TabBar 切换选项卡后，其对应的内容都会被重新生成
/// 如果你想保持每个 TabBar 对应的内容的状态，则定义此内容的类时需要 with AutomaticKeepAliveClientMixin
class _MyTextState extends State<_MyText> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    /// 你用了 with AutomaticKeepAliveClientMixin 则这里必须要 super.build(context);
    super.build(context);
    return Text(currentTimestamp().toString());
  }

  /// 需要保持状态
  @override
  bool get wantKeepAlive => true;
}