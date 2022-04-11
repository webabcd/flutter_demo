/*
 * Wrap - 可换行的水平布局，可换列的垂直布局
 *
 * 相对于 Row 来说 Wrap 是可换行的
 * 相对于 Column 来说 Wrap 是可换列的
 *
 * 本例演示了如何实现可换行的水平布局，可换列的垂直布局是类似的
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class WrapDemo extends StatefulWidget {
  const WrapDemo({Key? key}) : super(key: key);

  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {

  var _alignment = WrapAlignment.start;
  var _runAlignment = WrapAlignment.start;
  var _crossAxisAlignment = WrapCrossAlignment.start;

  void _changeAlignment() {
    setState(() {
      var index = _alignment.index + 1;
      if (index >= WrapAlignment.values.length) {
        index = 0;
      }
      _alignment = WrapAlignment.values[index];
    });
  }

  void _changeRunAlignment() {
    setState(() {
      var index = _runAlignment.index + 1;
      if (index >= WrapAlignment.values.length) {
        index = 0;
      }
      _runAlignment = WrapAlignment.values[index];
    });
  }

  void _changeCrossAxisAlignment() {
    setState(() {
      var index = _crossAxisAlignment.index + 1;
      if (index >= WrapCrossAlignment.values.length) {
        index = 0;
      }
      _crossAxisAlignment = WrapCrossAlignment.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          height: 400,
          child: Wrap(
            /// direction - 布局方向
            ///   horizontal - 可换行的水平布局
            ///   vertical - 可换列的垂直布局
            direction: Axis.horizontal,
            /// 主轴方向上的元素之间的间距
            spacing: 20,
            /// 交叉轴方向上的元素之间的间距
            runSpacing: 10,
            /// 以下 4 个属性类似 Flex/Row/Column，请参见 row.dart 和 column.dart 中的相关说明
            textDirection: TextDirection.ltr,
            alignment: _alignment,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: _crossAxisAlignment,
            /// runAlignment - 交叉轴方向的排列方式，以下说明以 TextDirection.ltr 且 VerticalDirection.down 为例
            ///   start - 线性排列，整体居左或居顶部
            ///   end - 线性排列，整体居右或居底部
            ///   center - 线性排列，整体居中
            runAlignment: _runAlignment,
            children: [
              Container(
                color: Colors.red[100],
                child: MyText("aaaaaa\naaa"),
              ),
              Container(
                color: Colors.red[200],
                child: MyText("bbb"),
              ),
              Container(
                color: Colors.red[300],
                child: MyText("ccc"),
              ),
              Container(
                color: Colors.red[400],
                child: MyText("dddddddddddddddd"),
              ),
              Container(
                color: Colors.red[500],
                child: MyText("eeeeee"),
              ),
              Container(
                color: Colors.red[600],
                child: MyText("fff\nfff\nfff\nffffff"),
              ),
              Container(
                color: Colors.red[700],
                child: MyText("ggg"),
              ),
            ],
          ),
        ),
        MyButton(
          onPressed: _changeAlignment,
          child: Text("alignment: ${_alignment.name}"),
        ),
        MyButton(
          onPressed: _changeRunAlignment,
          child: Text("runAlignment: ${_runAlignment.name}"),
        ),
        MyButton(
          onPressed: _changeCrossAxisAlignment,
          child: Text("crossAxisAlignment: ${_crossAxisAlignment.name}"),
        ),
      ],
    );
  }
}