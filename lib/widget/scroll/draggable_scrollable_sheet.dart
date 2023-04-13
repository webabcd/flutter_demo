/*
 * DraggableScrollableSheet - 可滚动组件，并且支持通过拖拽的方式上下展开
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class DraggableScrollableSheetDemo extends StatefulWidget {
  const DraggableScrollableSheetDemo({Key? key}) : super(key: key);

  @override
  _DraggableScrollableSheetDemoState createState() => _DraggableScrollableSheetDemoState();
}

class _DraggableScrollableSheetDemoState extends State<DraggableScrollableSheetDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      /// 监听当 DraggableScrollableSheet 的展开的高度发生变化时的通知
      body: NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          /// 当前展开的高度（占用父的百分比）
          log('extent:${notification.extent}');
          return true;
        },
        child: _buildDraggableScrollableSheet(),
      ),
    );
  }

  Widget _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      /// 初始时的高度（占用父的百分比）
      initialChildSize: 0.3,
      /// 最大高度（占用父的百分比）
      minChildSize: 0.1,
      /// 最小高度（占用父的百分比）
      maxChildSize: 1,
      /// 是否需要扩展以填充父的可用空间
      expand: true,
      /// 上下展开时，高度是否只能是固定的几个值
      /// false - 上下展开时，高度根据你的拖拽行为走
      /// true - 上下展开时，高度只能是 minChildSize, maxChildSize, snapSizes 中指定的值
      snap: true,
      snapSizes: const [],
      /// snap 为 true 时，上下展开的高度变化时，动画的持续时间（默认为 null 会根据你的拖拽速度和变化长度自动决定）
      snapAnimationDuration: null,
      /// 注：这里需要包含一个可滚动组件，本例用的是 ListView
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.green,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Center(child: MyTextSmall('$index')));
            },
          ),
        );
      },
    );
  }
}