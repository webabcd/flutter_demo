/*
 * ListTile - 列表项
 * 经常用于定义 ListView 中的项（相当于一个 item 模板吧），也可以单独使用
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ListTileDemo extends StatefulWidget {
  const ListTileDemo({Key? key}) : super(key: key);

  @override
  _ListTileDemoState createState() => _ListTileDemoState();
}

class _ListTileDemoState extends State<ListTileDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: _MyListView(),
    );
  }
}

class _MyListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 150,
      children: [
        ListTile(
          /// 左侧组件
          leading: const Icon(Icons.home),
          /// 右侧组件
          trailing: const Icon(Icons.close),
          /// 中间上面的组件
          title: const Text("title"),
          /// 中间下面的组件
          subtitle: const Text("subtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitle"),
          /// 内边距
          contentPadding: const EdgeInsets.all(20),
          /// 是否使用缩小布局
          dense: false,
          /// 边框
          shape: null,

          /// 单击时触发的事件
          onTap: () {
            log("onTap");
          },
          /// 长按时触发的事件
          onLongPress: () {
            log("onLongPress");
          },

          /// 背景颜色
          tileColor: Colors.blue,
          /// 选中状态时的背景颜色
          selectedTileColor: Colors.green,
          /// 文本颜色
          textColor: Colors.white,
          /// 选中状态时的文本颜色
          selectedColor: Colors.red,
          /// 图标颜色
          iconColor: Colors.orange,

          /// 是否是选中状态
          selected: false,
        ),
      ],
    );
  }
}