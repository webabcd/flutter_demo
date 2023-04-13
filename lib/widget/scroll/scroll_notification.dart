/*
 * ScrollNotification - 滚动通知
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class ScrollNotificationDemo extends StatefulWidget {
  const ScrollNotificationDemo({Key? key}) : super(key: key);

  @override
  _ScrollNotificationDemoState createState() => _ScrollNotificationDemoState();
}

class _ScrollNotificationDemoState extends State<ScrollNotificationDemo> {

  final String _string = "012345678901234567890123456789012345678901234567890123456789";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      /// 监听当滚动发生变化时的通知
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {          /// 滚动开始
            log('滚动开始');
          } else if (notification is ScrollUpdateNotification) {  /// 滚动中
            log('滚动中。。。');
          } else if (notification is ScrollEndNotification) {     /// 滚动结束
            log('滚动结束');
          }

          /// pixels - 当前滚动到的位置
          /// atEdge - 是否在滚动的边界
          /// outOfRange - 滚动是否越界
          /// axis - 垂直滚动还是水平滚动
          /// extentBefore - 垂直滚动时，可视区的顶部与全部内容的顶部的距离
          /// extentAfter - 垂直滚动时，可视区的底部与全部内容的底部的距离
          /// extentInside - 垂直滚动时，可视区的高度
          log('pixels:${notification.metrics.pixels}, '
              '${notification.metrics.extentBefore}, '
              '${notification.metrics.extentAfter}, '
              '${notification.metrics.extentInside}');

          /// return true 代表此通知已处理，也就是说通知不会冒泡
          return true;
        },
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children:_string.split("").map((c) => MyText(c)).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}