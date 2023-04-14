/*
 * Row - 水平弹性布局
 *
 * Row 在布局其子元素时，可以通过 Expanded 按比例指定每个元素的宽度，因为 Row 继承自 Flex（关于在 Row 中使用弹性布局 Expanded, Flexible, Spacer 请参见 flex.dart）
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class RowDemo extends StatefulWidget {
  const RowDemo({Key? key}) : super(key: key);

  @override
  _RowDemoState createState() => _RowDemoState();
}

class _RowDemoState extends State<RowDemo> {

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          color: Colors.red,
          child: Row(
            /// mainAxisSize - 主轴尺寸（对于 Row 来说就是水平方向的宽度）
            ///   max - 宽度为父的宽度，默认值
            ///   min - 宽度为所有子占用的水平空间的总和
            mainAxisSize: MainAxisSize.max,
            /// textDirection - 水平排列方向
            ///   ltr - 左到右，默认值
            ///   rtl - 右到左
            textDirection: TextDirection.ltr,
            /// mainAxisAlignment - 主轴方向的排列方式（对于 Row 来说就是每个元素水平方向的排列方式），以下说明以 TextDirection.ltr 为例
            ///   start - 线性排列，整体居左
            ///   end - 线性排列，整体居右
            ///   center - 线性排列，整体居中
            ///   spaceBetween - 每个元素中间的空白相同，两侧屏幕边缘和元素之间无空白
            ///   spaceAround - 每个元素中间的空白相同，两侧屏幕边缘和元素之间的空白为元素间空白的二分之一
            ///   spaceEvenly - 每个元素中间的空白相同，两侧屏幕边缘和元素之间的空白与元素间空白相同
            mainAxisAlignment: _mainAxisAlignment,
            /// verticalDirection - 垂直排列方向
            ///   down - 上到下，默认值
            ///   up - 下到上
            verticalDirection: VerticalDirection.down,
            /// crossAxisAlignment - 交叉轴方向的元素对齐方式（对于 Row 来说就是每个元素垂直方向的对齐方式），以下说明以 VerticalDirection.down 为例
            ///   start - 顶部对齐
            ///   end - 底部对齐
            ///   center - 中线对齐，默认值
            ///   stretch - 将每个元素的高度拉伸到与 Row 同高
            ///   baseline - 基线对齐
            crossAxisAlignment: _crossAxisAlignment,
            children: [
              MyText("a"),
              Container(
                height: 50,
                color: Colors.green,
                child: MyText("bb"),
              ),
              MyText("ccc"),
              Container(
                height: 100,
                color: Colors.green,
                child: MyText("dddd"),
              ),
            ],
          ),
        ),
        MyButton(
          onPressed: _changeMainAxisAlignment,
          child: Text("mainAxisAlignment: ${_mainAxisAlignment.name}"),
        ),
        MyButton(
          onPressed: _changeCrossAxisAlignment,
          child: Text("crossAxisAlignment: ${_crossAxisAlignment.name}"),
        ),
      ],
    );
  }
}