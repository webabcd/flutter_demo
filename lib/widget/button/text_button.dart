/*
 * TextButton - 文本按钮
 *
 * TextButton 是默认啥都没有的按钮，OutlinedButton 是默认有边框的按钮，ElevatedButton 是默认有背景色的按钮
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/helper.dart';

class TextButtonDemo extends StatefulWidget {
  const TextButtonDemo({Key? key}) : super(key: key);

  @override
  _TextButtonDemoState createState() => _TextButtonDemoState();
}

class _TextButtonDemoState extends State<TextButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          child: const Text("button"),            /// 文本按钮上显示的文本
          autofocus: false,                       /// 是否自动获取焦点
          onPressed: () { log("onPressed"); },    /// 单击事件，此为 required 字段（设置为 null 则代表按钮是 disable 状态）
          onLongPress: () { log("onLongPress"); },/// 长按事件
          style: TextButton.styleFrom(            /// 样式，通过 TextButton.styleFrom() 实现，如需要为按钮的不同状态指定不同的样式请参见后面的 ButtonStyle() 中的说明
            padding: const EdgeInsets.all(2),     ///   内边距
            foregroundColor: Colors.white,        ///   按钮文字颜色
            backgroundColor: Colors.blue,         ///   按钮背景颜色
            alignment: Alignment.center,          ///   按钮文字相对于按钮整体的对齐方式
            minimumSize: const Size(200, 0),      ///   最小尺寸
            maximumSize: const Size(1000, 40),    ///   最大尺寸
            fixedSize: const Size(0, 100),        ///   按钮尺寸，受 minimumSize 和 maximumSize 的限制
            textStyle: const TextStyle(           ///   按钮文字样式
                fontSize: 14,
                decoration: TextDecoration.none
            ),
            side: const BorderSide(               ///   按钮边框的大小和颜色
                color: Colors.red,
                width: 2,
            ),
            shape: const StadiumBorder(           ///   按钮的边框的样式（注：style 的 side 的优先级比 style 的 shape 的 side 的优先级要高）
              side: BorderSide(                   ///   由于本例指定了 style 的 side，所以此处的 style 的 shape 的 side 是无效的
                width: 100,
                color: Colors.green
              ),
            ),
          ),
        ),
        TextButton(
          child: const Text("button"),
          onPressed: () { },
          style: ButtonStyle(                                             /// 样式，通过 ButtonStyle() 实现，可以为按钮的不同状态指定不同的样式
            /// MaterialStateProperty - 用于为不同的状态设置不同的值
            backgroundColor: MaterialStateProperty.resolveWith((states) { ///   按钮背景颜色
              /// 按钮被单击时的背景色
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              /// 正常状态的背景色
              return Colors.blue;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) { ///   按钮的文字的颜色
              if (states.contains(MaterialState.pressed)) {
                return Colors.red;
              }
              return Colors.white;
            }),
            textStyle: MaterialStateProperty.resolveWith((states) {       ///   按钮的文字的样式（注：在此处设置文字颜色是无效的，请通过 foregroundColor 设置）
              if (states.contains(MaterialState.pressed)) {
                return TextStyle(fontSize: 48);
              }
              return TextStyle(fontSize: 24);
            }),
            overlayColor: MaterialStateProperty.resolveWith((states) {    ///   按钮被按下时，一个点击动画效果的颜色
              if (states.contains(MaterialState.pressed)) {
                return Colors.purple;
              }
              return null;
            }),
            shadowColor: MaterialStateProperty.all(Colors.orange),        ///   阴影的颜色
            elevation: MaterialStateProperty.all(10),                     ///   阴影的垂直方向的偏移量
            alignment: Alignment.center,                                  ///   按钮文字相对于按钮整体的对齐方式
            animationDuration: Duration(milliseconds: 200)                ///   按钮的各种状态转换时的动画效果的时长
          ),
        ),
        TextButton(
          child: const Text("button"),
          onPressed: () { },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(5)),        ///   内边距
            minimumSize: MaterialStateProperty.all(Size(200, 0)),         ///   最小尺寸
            maximumSize: MaterialStateProperty.all(Size(1000, 40)),       ///   最大尺寸
            fixedSize: MaterialStateProperty.all(Size(0, 100)),           ///   按钮尺寸，受 minimumSize 和 maximumSize 的限制
            side: MaterialStateProperty.all(                              ///   按钮边框的大小和颜色
              BorderSide(
                color: Colors.red,
                width: 2
              )
            ),
            shape: MaterialStateProperty.all(                             ///   按钮的边框的样式（注：style 的 side 的优先级比 style 的 shape 的 side 的优先级要高）
              const StadiumBorder(
                side: BorderSide(                                         ///   由于本例指定了 style 的 side，所以此处的 style 的 shape 的 side 是无效的
                  width: 100,
                  color: Colors.green
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
