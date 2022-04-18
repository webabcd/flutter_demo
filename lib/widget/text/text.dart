/*
 * Text - 文本显示框
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class TextDemo extends StatefulWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {

  final _text1 = Text(
    "webabcd wanglei\nabc",
    /// textAlign - 多行文本的对齐方式，这个指的是多行文本在 Text 内的对齐方式
    ///    left, right, center, start, end
    textAlign: TextAlign.right,
    /// textDirection - 文字方向
    ///    ltr, rtl
    textDirection: TextDirection.ltr,
    /// textScaleFactor - 文字相对于当前 fontSize 的放大倍数
    textScaleFactor: 1,
    /// style - 文本样式
    style: TextStyle(
      color: Colors.red,                            /// 文本颜色
      background: Paint()..color = Colors.green,    /// 文本背景色
      fontSize: 24,                                 /// 文字大小
      letterSpacing: 5,                             /// 每个字符之间的间距
      wordSpacing: 10,                              /// 每个单词之间的间距
      height: 1.5,                                  /// 行高（不是一个绝对值，而是影响行高的一个因子，行高的实际大小是由 height 和 fontSize 一起决定的）
      fontWeight: FontWeight.bold,                  /// 字体粗细（normal, bold, w100, w200, w300......）
      fontStyle: FontStyle.italic,                  /// 字体斜体（normal, italic）
      decoration:TextDecoration.lineThrough,        /// 划线位置（none无，underline下划线，overline上划线，lineThrough中划线）
      decorationStyle: TextDecorationStyle.solid,   /// 划线类型（solid, double, dotted, dashed, wavy）
      decorationColor: Colors.blue,                 /// 划线颜色
      decorationThickness: 3,                       /// 划线粗细
      shadows: const [                              /// 文艺阴影（一个 Shadow 类型对象的列表）
        Shadow(
          offset: Offset(5, 5),                     /// 阴影的偏移量
          color: Colors.yellow,                     /// 阴影的颜色
          blurRadius: 3.0,                          /// 阴影的模糊半径
        ),
      ],
    ),
  );

  var _text2Overflow = TextOverflow.clip;
  Text _getText2() => Text(
    "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz",
    /// maxLines - 最大行数
    maxLines: 2,
    /// softWrap - 超出范围时，是否换行
    ///    true - 换行
    ///    false - 不换行
    softWrap: false,
    /// overflow - 文字溢出时的处理逻辑（注：此属性也可以在 TextStyle 中指定）
    ///   clip - 溢出部分不显示
    ///   fade - 溢出部分不显示，边界部分增加淡化效果
    ///   ellipsis - 溢出的部分用 ... 代替
    ///   visible - 在容器外渲染溢出文本
    overflow: _text2Overflow,
    style: const TextStyle(
      color: Colors.red,
      fontSize: 24,
      decoration:TextDecoration.none,
    ),
  );
  void _changeText2Overflow() {
    setState(() {
      var index = _text2Overflow.index + 1;
      if (index >= TextOverflow.values.length) {
        index = 0;
      }
      _text2Overflow = TextOverflow.values[index];
    });
  }

  /// 通过 Text.rich() 构造 Text 对象
  /// 在 Text.rich() 中可以设置 TextSpan，其用于设置 Text 中的不同文本的不同样式
  final _text3 = const Text.rich(
    TextSpan(
      text: 'webabcd\n', // default text style
      style: TextStyle(
        color: Colors.red,
      ),
      /// TextSpan 内可以附加多个 TextSpan，你可以为每个 TextSpan 指定不同的样式，并且子会继承父的样式
      children: [
        TextSpan(text: 'webabcd\n', style: TextStyle(fontStyle: FontStyle.italic)),
        TextSpan(text: 'webabcd', style: TextStyle(letterSpacing: 10)),
      ],
    ),
    style: TextStyle(
      fontSize: 24,
      decoration:TextDecoration.none,
    ),
  );

  /// DefaultTextStyle - 用于指定所有子 Text 的默认样式
  final _text4 = DefaultTextStyle(
    style: const TextStyle(
      color:Colors.red,
      fontSize: 20.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text("abc"),
        Text("ijk"),
        Text(
          "xyz",
          style: TextStyle(
            inherit: false, /// inherit - 是否继承默认样式（默认值为 true）
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: _text1,
          onTap: () {
            /// 获取 Text 的最终渲染的宽和高
            var size = getTextSize(_text1.data!, _text1.style!,);
            log("size: $size");
          },
        ),
        GestureDetector(
          child: Container(
            color: Colors.green,
            width: 300,
            height: 60,
            child: _getText2(),
          ),
          onTap: () {
            setState(() {
              _changeText2Overflow();
            });
          },
        ),
        _text3,
        _text4,
      ],
    );
  }
}

/// 获取 Text 的实际占用空间的大小
Size getTextSize(String text, TextStyle style,  {int maxLines = 2^31, double maxWidth = double.infinity}) {
  if (text.isEmpty) {
    return Size.zero;
  }

  final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text: text, style: style), maxLines: maxLines)
    ..layout(maxWidth: maxWidth);

  return textPainter.size;
}