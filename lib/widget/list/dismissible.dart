/*
 * Dismissible - 滑动删除
 *
 * 支持左滑/右滑/上滑/下滑删除，一般在列表中使用，当然也可以不依托列表使用
 */

import 'package:flutter/material.dart';

import '../../helper.dart';

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({Key? key}) : super(key: key);

  @override
  _DismissibleDemoState createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      backgroundColor: Colors.orange,
      body: const _MyWidget(),
    );
  }
}

class _MyWidget extends StatefulWidget {
  const _MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_MyWidget> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          /// 必须要指定 key
          key: ValueKey<int>(items[index]),

          /// 滑动删除支持的滑动方向（vertical, horizontal, endToStart, startToEnd, up, down, none）
          direction: DismissDirection.horizontal,
          /// 正常状态下显示的内容
          child: ListTile(
            title: MyText('item ${items[index]}',),
          ),
          /// item 的背景内容（右滑删除操作时）
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const MyTextSmall("右滑删除"),
          ),
          /// item 的背景内容（左滑删除操作时）
          secondaryBackground: Container(
            color: Colors.green,
            alignment: Alignment.centerRight,
            child: const MyTextSmall("左滑删除"),
          ),
          /// 滑动删除时，item 的偏移系数（偏移量为偏移系数 * item 的高）
          crossAxisEndOffset: 0.0,

          /// 删除前的回调，用于确认是否真的删除
          confirmDismiss: (DismissDirection direction) async {
            var result = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text("确认删除吗？"),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("删除"),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("取消"),
                    ),
                  ],
                );
              },
            );
            /// 返回 true 则会触发 onDismissed() 回调
            return result;
          },
          /// 删除后的回调
          onDismissed: (DismissDirection direction) {
            setState(() {
              items.removeAt(index);
            });
          },

          /// 删除后，删除项的下面的项会移上来，这里用于设置这个动画的时长
          resizeDuration: const Duration(milliseconds: 300),
          /// 删除后，删除项的下面的项会移上来，这个动画效果的每一帧都会触发这个事件
          onResize: () {
            /// log("onResize");
          },
          /// 滑动的进度发生变化时会触发此事件
          onUpdate: (DismissUpdateDetails details) {
            log("onUpdate, progress:${details.progress}, reached:${details.reached}");
          },
          /// 滑动删除动画的时长（快速惯性滑动时此值无效）
          movementDuration: const Duration(milliseconds: 200),
          /// 用于指定拖动到什么程度时触发 onDismissed
          dismissThresholds: const {
            DismissDirection.startToEnd: 0.8, /// 右滑时，在超过 80% 的位置松开手则会触发 onDismissed（快速惯性滑动时此值无效）
            DismissDirection.endToStart: 0.3  /// 左滑时，在超过 30% 的位置松开手则会触发 onDismissed（快速惯性滑动时此值无效）
          },
        );
      },
    );
  }
}
