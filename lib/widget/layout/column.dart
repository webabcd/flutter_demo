/*
 * Column - 垂直布局
 *
 * Column 在布局其子元素时，可以通过 Expanded 按比例指定每个元素的高度，因为 Column 继承自 Flex（关于在 Column 中使用 Expanded, Spacer 请参见 flex.dart）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class ColumnDemo extends StatefulWidget {
  const ColumnDemo({Key? key}) : super(key: key);

  @override
  _ColumnDemoState createState() => _ColumnDemoState();
}

class _ColumnDemoState extends State<ColumnDemo> {

  var _mainAxisAlignment = MainAxisAlignment.start;
  var _crossAxisAlignment = CrossAxisAlignment.center;

  void _changeMainAxisAlignment() {
    setState(() {
      var index = _mainAxisAlignment.index + 1;
      if (index >= MainAxisAlignment.values.length) {
        index = 0;
      }
      _mainAxisAlignment = MainAxisAlignment.values[index];
    });
  }

  void _changeCrossAxisAlignment() {
    setState(() {
      var index = _crossAxisAlignment.index + 1;
      if (index >= CrossAxisAlignment.values.length - 1) {
        index = 0;
      }
      _crossAxisAlignment = CrossAxisAlignment.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          /// Column 的宽度默认是其子的最大宽度，但是这样 Column 的 CrossAxisAlignment.stretch 是没有效果的
          /// 所以这里指定了 Column 的宽度，这样 Column 的 CrossAxisAlignment.stretch 就有效了
          width: 200,
          color: Colors.red,
          child: Column(
            /// textDirection - 水平排列方向
            ///   ltr - 左到右，默认值
            ///   rtl - 右到左
            textDirection: TextDirection.ltr,
            /// mainAxisSize - 主轴尺寸（对于 Column 来说就是垂直方向的高度）
            ///   max - 高度为父的高度，默认值
            ///   min - 高度为所有子占用的垂直空间的总和
            mainAxisSize: MainAxisSize.max,
            /// mainAxisAlignment - 主轴方向的排列方式（对于 Column 来说就是垂直方向的排列方式），以下说明以 VerticalDirection.down 为例
            ///   start - 线性排列，整体居顶部
            ///   end - 线性排列，整体居底部
            ///   center - 线性排列，整体居中
            ///   spaceBetween - 每个元素中间的空白相同，两侧屏幕边缘和元素之间无空白
            ///   spaceAround - 每个元素中间的空白相同，两侧屏幕边缘和元素之间的空白为元素间空白的二分之一
            ///   spaceEvenly - 每个元素中间的空白相同，两侧屏幕边缘和元素之间的空白与元素间空白相同
            mainAxisAlignment: _mainAxisAlignment,
            /// verticalDirection - 垂直排列方向
            ///   down - 上到下，默认值
            ///   up - 下到上
            verticalDirection: VerticalDirection.down,
            /// crossAxisAlignment - 交叉轴方向的排列方式（对于 Column 来说就是水平方向的排列方式），以下说明以 TextDirection.ltr 为例
            ///   start - 左对齐
            ///   end - 右对齐
            ///   center - 中线对齐，默认值
            ///   stretch - 将每个元素的宽度拉伸到与 Column 同宽（需要指定 Column 的宽度，本例通过 Container() 指定了 Column 的宽度）
            ///   baseline - 基线对齐
            crossAxisAlignment: _crossAxisAlignment,
            children: [
              MyText("aaa"),
              Container(
                width: 50,
                color: Colors.green,
                child: MyText("bbb"),
              ),
              MyText("ccc"),
              Container(
                width: 100,
                color: Colors.green,
                child: MyText("ddd"),
              ),
            ],
          ),
        ),
        MyButton(
          onPressed: _changeMainAxisAlignment,
          child: Text(_mainAxisAlignment.name),
        ),
        MyButton(
          onPressed: _changeCrossAxisAlignment,
          child: Text(_crossAxisAlignment.name),
        ),
      ],
    );
  }
}