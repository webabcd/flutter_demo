/*
 * RichText - 富文本
 *
 * RichText 通过 TextSpan 显示不同格式不同行为的文本
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class RichTextDemo extends StatefulWidget {
  const RichTextDemo({Key? key}) : super(key: key);

  @override
  _RichTextDemoState createState() => _RichTextDemoState();
}

class _RichTextDemoState extends State<RichTextDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title"),),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              /// RichText 通过 TextSpan 显示不同格式不同行为的文本
              text: TextSpan(
                /// TextSpan 显示的文本内容
                text: 'aaaaaa ',
                /// TextSpan 显示的文本样式
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                /// TextSpan 内可以嵌套多个 TextSpan
                /// 嵌套的 TextSpan 会继承父 TextSpan 的样式
                children: [
                  TextSpan(text: 'bbbbbb'),
                  TextSpan(text: 'cccccc', style: TextStyle(fontSize: 24.0, color: Colors.green, fontWeight: FontWeight.bold),),
                  TextSpan(
                    text: 'dddddd',
                    /// 通过 recognizer 定义 TextSpan 的行为
                    /// 支持 TapGestureRecognizer(), LongPressGestureRecognizer(), DoubleTapGestureRecognizer(), PanGestureRecognizer(), HorizontalDragGestureRecognizer(), VerticalDragGestureRecognizer(), ScaleGestureRecognizer() 等
                    /// 如果需要自定义的话就重写 BaseTapGestureRecognizer 即可
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        log("onTap");
                      },
                  ),
                  /// TextSpan 可以无限嵌套
                  TextSpan(
                    text: 'eeeeee',
                    children: [
                      TextSpan(text: 'ffffff'),
                      TextSpan(text: 'gggggg'),
                    ],
                  ),
                ],
              ),
            ),

            /// 可以通过 Text.rich() 构造 RichText
            Text.rich(
              TextSpan(text: 'aaaaaa', style: TextStyle(fontSize: 24.0, color: Colors.white, letterSpacing: 10)),
            ),

            RichText(
              text: TextSpan(
                text: 'aaaaaa\nbbbbbbbbb\nccccccccccccnccccccccccccnccccccccccccnccccccccccccnccccccccccccnccccccccccccnccccccccccccnccccccccccccnccccccccccccncccccccccccc\ndddddd',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              /// 超出范围时，是否换行
              softWrap: true,
              /// 最大行数
              maxLines: 3,
              /// 文本的对齐方式
              textAlign: TextAlign.start,
              /// overflow - 文字溢出时的处理逻辑（注：此属性也可以在 TextStyle 中指定）
              ///   clip - 溢出部分不显示
              ///   fade - 溢出部分不显示，边界部分增加淡化效果
              ///   ellipsis - 溢出的部分用 ... 代替
              ///   visible - 在容器外渲染溢出文本
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}