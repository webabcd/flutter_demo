/*
 * ExpansionPanelList - 可展开列表
 *
 * ExpansionPanelList 中的每一项是 ExpansionPanel
 * 点击 ExpansionPanel 的 header 后就会显示或隐藏 ExpansionPanel 的 body
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  const ExpansionPanelListDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {

  final List<_MyItem> _dataList = _MyItem.generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      /// ExpansionPanelList 是不可滚动的，如需滚动则可以在外面加一层 SingleChildScrollView
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ExpansionPanelList(
          /// 展开/收缩动画的时长
          animationDuration: const Duration(milliseconds: 500),
          /// 展开后，header 的内边距
          expandedHeaderPadding: const EdgeInsets.all(10),
          /// 分隔线的颜色
          dividerColor: Colors.green,
          /// 展开/收缩之后的回调
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _dataList[index].isExpanded = !isExpanded;
            });
          },
          /// 构造列表中的每一个可展开项
          children: _dataList.map<ExpansionPanel>((_MyItem item) {
            return ExpansionPanel(
              /// 背景
              backgroundColor: Colors.red,
              /// 点击 header 后是否触发展开/收缩（如果设置为 false 则只有点击 header 右侧的小三角才能触发展开/收缩）
              canTapOnHeader: true,
              /// header（点击 header 则显示或隐藏 body）
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: MyTextSmall(item.headerValue),
                );
              },
              /// body（点击 header 则显示或隐藏 body）
              body: Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                color: Colors.blue,
                child: MyText(item.bodyValue),
              ),

              /// 是否是展开状态
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _MyItem {
  _MyItem({
    required this.bodyValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String bodyValue;
  String headerValue;
  bool isExpanded;

  static List<_MyItem> generateItems(int numberOfItems) {
    return List<_MyItem>.generate(numberOfItems, (int index) {
      return _MyItem(
        headerValue: 'header $index',
        bodyValue: 'body $index',
      );
    });
  }
}


