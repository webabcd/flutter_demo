/*
 * ReorderableListView - 可拖拽排序的列表
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ReorderableListViewDemo extends StatefulWidget {
  const ReorderableListViewDemo({Key? key}) : super(key: key);

  @override
  _ReorderableListViewDemoState createState() => _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {

  List<String> _dataList = [];

  @override
  void initState() {
    super.initState();

    _dataList = ['content1', 'content2', 'content3', 'content4', 'content5'];
  }

  Widget _getItem(String content) {
    return Container(
      /// 可拖拽的项必须要指定 key
      key: ValueKey(content),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: MyTextSmall(content),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    log('onReorder, oldIndex:$oldIndex, newIndex:$newIndex');
    setState(() {
      /// 按照拖拽排序的结果重新排序数据源，并重新渲染
      var item = _dataList.removeAt(oldIndex);
      if (newIndex > oldIndex) {
        _dataList.insert(newIndex - 1, item);
      } else {
        _dataList.insert(newIndex, item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView(
              /// 滚动方向 vertical 或 horizontal
              scrollDirection: Axis.vertical,
              /// header
              header: const MyText("header"),
              /// footer
              footer: const MyText("footer"),
              /// 内边距
              padding: EdgeInsets.zero,
              /// 是否反向排列
              reverse: false,
              /// 指定 ReorderableListView 关联的 ScrollController
              scrollController: null,
              /// 滚动到边缘时的物理效果，参见 /lib/widget/scroll/single_child_scroll_view.dart
              physics: const BouncingScrollPhysics(),
              /// 留白区域占可视区的百分比（0.0 - 1.0 之间）
              anchor: 0.0,
              /// 用于定义每个元素在滚动方向上的尺寸
              /// 也可以不指定这个，那么就由每个元素自己决定尺寸（注：建议使用 itemExtent 指定尺寸，这样性能会好一些）
              itemExtent: 40,

              /// 构造 ReorderableListView 中的每一项
              children: _dataList.map((e) => _getItem(e)).toList(),

              /// 拖拽排序操作完成后
              onReorder: _onReorder,
              /// 拖拽开始
              onReorderStart: (index) {
                log("onReorderStart:$index");
              },
              /// 拖拽结束
              onReorderEnd: (index) {
                log("onReorderEnd:$index");
              },
            ),
          ),

          /// 本例用于演示如何自定义拖拽行为，以及如何自定义拖拽中的项的样式
          /// 默认 android/ios 长按项后可拖拽，本例可以实现 android/ios 点击项后可拖拽
          Expanded(
            child: ReorderableListView(
              itemExtent: 40,
              onReorder: _onReorder,

              /// 禁用默认的拖拽行为
              buildDefaultDragHandles: false,
              /// 构造 ReorderableListView 中的每一项，并自定义其拖拽行为
              children: [
                for (int index = 0; index < _dataList.length; index++)
                  /// ReorderableDelayedDragStartListener - 长按项后即可拖拽
                  /// ReorderableDragStartListener - 点击项后即可拖拽
                  ReorderableDragStartListener (
                    key: ValueKey(_dataList[index]),
                    index: index,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: MyTextSmall(_dataList[index]),
                    ),
                  ),
              ],

              /// 用于定义拖拽中的项的样式
              ///   child - 拖拽中的项
              ///   index - 拖拽中的项的索引位置
              proxyDecorator: (Widget child, int index, Animation<double> animation) {
                return Material(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: child,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}